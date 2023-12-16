import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_by_date_request.freezed.dart';
part 'post_by_date_request.g.dart';

@freezed
class PostByDateRequest with _$PostByDateRequest {
  factory PostByDateRequest(
      {required String date,
      required int max,
      @JsonKey(name: "is_fresh_data_required")
      @Default(true)
      bool isFreshDataRequired}) = _PostByDateRequest;

  factory PostByDateRequest.fromJson(Map<String, Object?> json) =>
      _$PostByDateRequestFromJson(json);
}
