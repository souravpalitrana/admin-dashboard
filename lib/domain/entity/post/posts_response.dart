import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:admin_dashboard/domain/entity/post/post.dart';

part 'posts_response.freezed.dart';
part 'posts_response.g.dart';

@freezed
class PostsResponse with _$PostsResponse {
  factory PostsResponse({
    @JsonKey(name: "posts") required List<Post> posts,
  }) = _PostsResponse;

  factory PostsResponse.fromJson(Map<String, Object?> json) =>
      _$PostsResponseFromJson(json);

  /*factory PostsResponse.convert(Map<String, Object?> json) {
    List<Post> allPostList = [];
    final allPostJson = json["posts"];
    final listDynamic = allPostJson as List<dynamic>;
    for (var element in listDynamic) {
      print("Going to parse ${element["title"]}");
      final newPost = Post.fromJson(element);
      allPostList.add(newPost);
    }

    return PostsResponse(posts: allPostList);
  }*/
}
