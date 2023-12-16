// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_by_date_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostByDateRequest _$$_PostByDateRequestFromJson(Map<String, dynamic> json) =>
    _$_PostByDateRequest(
      date: json['date'] as String,
      max: json['max'] as int,
      isFreshDataRequired: json['is_fresh_data_required'] as bool? ?? true,
    );

Map<String, dynamic> _$$_PostByDateRequestToJson(
        _$_PostByDateRequest instance) =>
    <String, dynamic>{
      'date': instance.date,
      'max': instance.max,
      'is_fresh_data_required': instance.isFreshDataRequired,
    };
