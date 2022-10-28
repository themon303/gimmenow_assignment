/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the UserLocation type in your schema. */
@immutable
class UserLocation extends Model {
  static const classType = const _UserLocationModelType();
  final String id;
  final String? _userID;
  final double? _previousLat;
  final double? _previousLong;
  final double? _currentLat;
  final double? _currentLong;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get userID {
    try {
      return _userID!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get previousLat {
    try {
      return _previousLat!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get previousLong {
    try {
      return _previousLong!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get currentLat {
    try {
      return _currentLat!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  double get currentLong {
    try {
      return _currentLong!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const UserLocation._internal({required this.id, required userID, required previousLat, required previousLong, required currentLat, required currentLong}): _userID = userID, _previousLat = previousLat, _previousLong = previousLong, _currentLat = currentLat, _currentLong = currentLong;
  
  factory UserLocation({String? id, required String userID, required double previousLat, required double previousLong, required double currentLat, required double currentLong}) {
    return UserLocation._internal(
      id: id == null ? UUID.getUUID() : id,
      userID: userID,
      previousLat: previousLat,
      previousLong: previousLong,
      currentLat: currentLat,
      currentLong: currentLong);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserLocation &&
      id == other.id &&
      _userID == other._userID &&
      _previousLat == other._previousLat &&
      _previousLong == other._previousLong &&
      _currentLat == other._currentLat &&
      _currentLong == other._currentLong;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("UserLocation {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("previousLat=" + (_previousLat != null ? _previousLat!.toString() : "null") + ", ");
    buffer.write("previousLong=" + (_previousLong != null ? _previousLong!.toString() : "null") + ", ");
    buffer.write("currentLat=" + (_currentLat != null ? _currentLat!.toString() : "null") + ", ");
    buffer.write("currentLong=" + (_currentLong != null ? _currentLong!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  UserLocation copyWith({String? id, String? userID, double? previousLat, double? previousLong, double? currentLat, double? currentLong}) {
    return UserLocation(
      id: id ?? this.id,
      userID: userID ?? this.userID,
      previousLat: previousLat ?? this.previousLat,
      previousLong: previousLong ?? this.previousLong,
      currentLat: currentLat ?? this.currentLat,
      currentLong: currentLong ?? this.currentLong);
  }
  
  UserLocation.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userID = json['userID'],
      _previousLat = (json['previousLat'] as num?)?.toDouble(),
      _previousLong = (json['previousLong'] as num?)?.toDouble(),
      _currentLat = (json['currentLat'] as num?)?.toDouble(),
      _currentLong = (json['currentLong'] as num?)?.toDouble();
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userID': _userID, 'previousLat': _previousLat, 'previousLong': _previousLong, 'currentLat': _currentLat, 'currentLong': _currentLong
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'userID': _userID, 'previousLat': _previousLat, 'previousLong': _previousLong, 'currentLat': _currentLat, 'currentLong': _currentLong
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField PREVIOUSLAT = QueryField(fieldName: "previousLat");
  static final QueryField PREVIOUSLONG = QueryField(fieldName: "previousLong");
  static final QueryField CURRENTLAT = QueryField(fieldName: "currentLat");
  static final QueryField CURRENTLONG = QueryField(fieldName: "currentLong");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "UserLocation";
    modelSchemaDefinition.pluralName = "UserLocations";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserLocation.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserLocation.PREVIOUSLAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserLocation.PREVIOUSLONG,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserLocation.CURRENTLAT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: UserLocation.CURRENTLONG,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
  });
}

class _UserLocationModelType extends ModelType<UserLocation> {
  const _UserLocationModelType();
  
  @override
  UserLocation fromJson(Map<String, dynamic> jsonData) {
    return UserLocation.fromJson(jsonData);
  }
}