import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:gimmenow_assignment/controllers/home_controller.dart';
import 'package:gimmenow_assignment/utils/app_constant.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeCtrl = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GIMMENOW"),
        actions: [
          IconButton(onPressed: () => _homeCtrl.signOut(), icon: const Icon(Icons.logout_sharp)),
        ],
      ),
      body: GestureDetector(
        child: Stack(
          children: [
            Obx(
              () => _homeCtrl.locationData.value == null
                  ? const Center(child: CircularProgressIndicator())
                  : FlutterMap(
                      options: MapOptions(
                        minZoom: 5,
                        maxZoom: 18,
                        zoom: 14,
                        center: LatLng(
                          _homeCtrl.locationData.value?.latitude ?? 0,
                          _homeCtrl.locationData.value?.longitude ?? 0,
                        ),
                        onTap: (tapPoss, location) => _homeCtrl.updateDestPos(null),
                      ),
                      layers: [
                        TileLayerOptions(
                          urlTemplate: AppConstants.mapBoxStyleUrl,
                          additionalOptions: {
                            'mapStyleId': AppConstants.mapBoxStyleId,
                            'accessToken': AppConstants.mapBoxAccessToken,
                          },
                        ),
                        ..._homeCtrl.listhub
                            .map(
                              (item) => PolygonLayerOptions(
                                polygonCulling: false,
                                polygons: [
                                  Polygon(
                                      points: item.polygon?.map((e) => LatLng(e.last, e.first)).toList() ?? [],
                                      color: Colors.blue,
                                      borderColor: Colors.blue,
                                      borderStrokeWidth: 5,
                                      // isFilled: true,
                                      label: '${item.displayName}',
                                      labelStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                      labelPlacement: PolygonLabelPlacement.centroid),
                                ],
                              ),
                            )
                            .toList(),
                        MarkerLayerOptions(
                          markers: [
                            ..._homeCtrl.listhub.map(
                              (item) => Marker(
                                point: LatLng(item.latitude, item.longitude),
                                width: 60,
                                height: 60,
                                builder: (context) => IconButton(
                                  icon: const Icon(Icons.house, size: 40, color: Colors.red),
                                  onPressed: () => _homeCtrl.updateDestPos(LatLng(item.latitude, item.longitude)),
                                ),
                              ),
                            ),
                            Marker(
                              point: LatLng(
                                _homeCtrl.locationData.value?.latitude ?? 0,
                                _homeCtrl.locationData.value?.longitude ?? 0,
                              ),
                              width: 60,
                              height: 60,
                              builder: (context) => const Icon(Icons.place, size: 40, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
      // floatingActionButton: Obx(
      //   () => _homeCtrl.destPos.value != null
      //       ? FloatingActionButton(
      //           onPressed: () => _homeCtrl.startNavigation(),
      //           child: const Icon(Icons.directions),
      //         )
      //       : const SizedBox.shrink(),
      // ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Obx(
            () => _homeCtrl.destPos.value != null
                ? FloatingActionButton(
                    onPressed: () => _homeCtrl.startNavigation(),
                    child: const Icon(Icons.directions),
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(height: 10),
          Obx(
            () => _homeCtrl.isInsidePolygon.value
                ? TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {},
                    child: const Text("Pickup Order", style: TextStyle(color: Colors.white)),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
