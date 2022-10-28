import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geojson/geojson.dart';
import 'package:get/get.dart';
import 'package:gimmenow_assignment/controllers/home_controller.dart';
import 'package:gimmenow_assignment/utils/app_constant.dart';
import 'package:latlong2/latlong.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _homeCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final geo = GeoJson();
    return Scaffold(
      appBar: AppBar(
        title: const Text("GIMMENOW"),
        actions: [IconButton(onPressed: () => _homeCtrl.signOut(), icon: const Icon(Icons.logout_sharp))],
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: AppConstants.myLocation,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: AppConstants.mapBoxStyleUrl,
                additionalOptions: {
                  'mapStyleId': AppConstants.mapBoxStyleId,
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
              MarkerLayerOptions(
                markers: _homeCtrl.listhub
                    .map((item) => Marker(
                          point: LatLng(item.latitude, item.longitude),
                          width: 60,
                          height: 60,
                          builder: (context) => Column(
                            children: [
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Text(
                                    '${item.displayName}',
                                  ),
                                ),
                              ),
                              const Icon(Icons.place, size: 40, color: Colors.red),
                            ],
                          ),
                        ))
                    .toList(),
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
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }
}
