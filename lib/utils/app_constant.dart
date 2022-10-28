import 'package:latlong2/latlong.dart';

class AppConstants {
  static const String mapBoxAccessToken =
      'pk.eyJ1IjoicGhvbmd2dTE0IiwiYSI6ImNsOXI4a3p0NTE4NnYzcnA4bWZ6eHBhMmoifQ.F54Qaf5DPGqnU4g11GCawA';

  static const String mapBoxStyleUrl =
      'https://api.mapbox.com/styles/v1/phongvu14/cl9r8u4h4000015mvd5t4l3fr/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicGhvbmd2dTE0IiwiYSI6ImNsOXI4a3p0NTE4NnYzcnA4bWZ6eHBhMmoifQ.F54Qaf5DPGqnU4g11GCawA';

  static const String mapBoxStyleId = 'cl9r8u4h4000015mvd5t4l3fr';

  static final myLocation = LatLng(-37.883258084328645, 145.0528208930866);
}
