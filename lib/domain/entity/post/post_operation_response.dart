// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_operation_response.freezed.dart';
part 'post_operation_response.g.dart';

@freezed
class PostOperationResponse with _$PostOperationResponse {
  factory PostOperationResponse({
    @JsonKey(name: "status") required bool status,
    @JsonKey(name: "message") required String message,
  }) = _PostOperationResponse;

  factory PostOperationResponse.fromJson(Map<String, Object?> json) =>
      _$PostOperationResponseFromJson(json);
}
