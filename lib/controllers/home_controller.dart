import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_mapbox_navigation/library.dart';
import 'package:geojson/geojson.dart';
import 'package:geopoint/geopoint.dart';
import 'package:get/get.dart';
import 'package:gimmenow_assignment/amplify_models/UserLocation.dart';
import 'package:gimmenow_assignment/data/data.dart';
import 'package:gimmenow_assignment/models/hub.dart';
import 'package:gimmenow_assignment/utils/utilities.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final List<Hub> listhub = Utilities.jsonToList(AppData.sampleData, Hub.fromJson) ?? [];
  final destPos = Rx<LatLng?>(null);
  final isInsidePolygon = false.obs;

  late MapBoxNavigation _directions;

  late Location _location;
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  final locationData = Rx<LocationData?>(null);
  late AuthUser user;

  @override
  void onInit() async {
    super.onInit();
    initialize();
    user = await Amplify.Auth.getCurrentUser();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> initialize() async {
    _location = Location();
    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _location.getLocation().then((value) => locationData.value = value);

    _location.onLocationChanged.listen((LocationData currentLocation) {
      locationData.value = currentLocation;
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        updateUserLocation(currentLocation);
        checkIsInsidePolygon(
          [
            GeoJsonPoint(geoPoint: GeoPoint(latitude: currentLocation.latitude!, longitude: currentLocation.longitude!))
          ],
        );
      }
    });

    _directions = MapBoxNavigation();
  }

  Future<List<UserLocation>?> readUserLocation() async {
    try {
      return await Amplify.DataStore.query(UserLocation.classType, where: UserLocation.USERID.eq(user.userId));
    } on DataStoreException catch (e) {
      safePrint('Query failed: $e');
    }
    return null;
  }

  Future<void> updateUserLocation(LocationData currentLocation) async {
    final oldDataList = await readUserLocation();
    final oldData = oldDataList!.isNotEmpty ? oldDataList.first : null;
    UserLocation newData;
    if (oldData != null) {
      newData = UserLocation(
        id: oldData.id,
        userID: user.userId,
        previousLat: oldData.currentLat,
        previousLong: oldData.currentLong,
        currentLat: currentLocation.latitude!,
        currentLong: currentLocation.longitude!,
      );
      if (oldData.currentLat == newData.currentLat && oldData.currentLong == newData.currentLong) return;
      await Amplify.DataStore.save(newData);
    } else {
      newData = UserLocation(
        userID: user.userId,
        previousLat: 0,
        previousLong: 0,
        currentLat: currentLocation.latitude!,
        currentLong: currentLocation.longitude!,
      );
      await Amplify.DataStore.save(newData);
    }
  }

  Future<void> checkIsInsidePolygon(List<GeoJsonPoint> points) async {
    final geo = GeoJson();
    List<GeoJsonPoint> foundPoints = [];
    for (var item in listhub) {
      var geoPoints = item.polygon?.map((e) => GeoPoint(latitude: e.last, longitude: e.first)).toList();
      var polygon = GeoSerie(
        geoPoints: geoPoints,
        name: item.displayName ?? '',
        type: GeoSerieType.polygon,
      );
      var geoJsonPolygon = GeoJsonPolygon(geoSeries: [polygon]);
      await geo.geofencePolygon(polygon: geoJsonPolygon, points: points, disableStream: true, verbose: true);
      foundPoints = geo.points;
      if (foundPoints.isNotEmpty) {
        isInsidePolygon.value = true;
        break;
      }
    }
    if (foundPoints.isEmpty) {
      isInsidePolygon.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  Future<void> updateDestPos(LatLng? pos) async {
    destPos.value = pos;
  }

  Future<void> startNavigation() async {
    if (destPos.value == null || locationData.value == null) return;
    var wayPoints = <WayPoint>[];
    wayPoints.add(
      WayPoint(
          name: "Current location", latitude: locationData.value?.latitude, longitude: locationData.value?.longitude),
    );
    wayPoints.add(
      WayPoint(
        name: "Destination",
        latitude: destPos.value!.latitude,
        longitude: destPos.value!.longitude,
      ),
    );
    await _directions.startNavigation(
        wayPoints: wayPoints,
        options: MapBoxOptions(
            mode: MapBoxNavigationMode.drivingWithTraffic,
            simulateRoute: true,
            language: "en",
            units: VoiceUnits.metric));
  }
}
