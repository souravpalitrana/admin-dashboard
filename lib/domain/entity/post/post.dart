// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  factory Post(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") required String title,
      @JsonKey(name: "description") required String description,
      @JsonKey(name: "date") required String date,
      @JsonKey(name: "active") required int active,
      @JsonKey(name: "cover_img_url") required String coverImageUrl,
      @JsonKey(name: "post_web_url") @Default("") String postWebUrl,
      @JsonKey(name: "post_mobile_url") required String postMobileUrl,
      @JsonKey(name: "view_count") @Default(1) int viewCount}) = _Post;

  factory Post.fromJson(Map<String, Object?> json) => _$PostFromJson(json);
}
