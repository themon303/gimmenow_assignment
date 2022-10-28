class Hub {
  final double latitude;
  final double longitude;
  final String? displayName;
  final List<List<double>>? polygon;

  Hub({
    required this.latitude,
    required this.longitude,
    this.displayName,
    this.polygon,
  });

  factory Hub.fromJson(Map<String, dynamic> json) => Hub(
        latitude: json['Latitude'] as double? ?? 0.0,
        longitude: json['Longitude'] as double? ?? 0.0,
        displayName: json['GeoHubTileDistance']["Poi"]["properties"]["display_name"] as String?,
        polygon: json['GeoHubTileDistance']["Poi"]["geometry"]["coordinates"] as List<List<double>>?,
      );
}
