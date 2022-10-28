class Utilities {
  /// Checks if data is null or empty.
  static bool isNullOrEmpty(dynamic value) {
    if (value == null) {
      return true;
    }
    if (value is String) {
      return value.toString().trim().isEmpty;
    }
    if (value is List && value.isEmpty) {
      return true;
    }
    if (value is Iterable && value.isEmpty) {
      return true;
    }
    if (value is Map && value.isEmpty) {
      return true;
    }
    return false;
  }

  static T? jsonToModel<T>(dynamic json, T Function(Map<String, dynamic> data) factory) {
    return isNullOrEmpty(json) ? null : factory(json);
  }

  static List<T>? jsonToList<T>(dynamic json, T Function(Map<String, dynamic> data) factory) {
    return isNullOrEmpty(json) ? null : (json as List).map((model) => factory(model)).toList();
  }
}
