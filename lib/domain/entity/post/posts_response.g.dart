// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostsResponse _$$_PostsResponseFromJson(Map<String, dynamic> json) =>
    _$_PostsResponse(
      posts: (json['posts'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PostsResponseToJson(_$_PostsResponse instance) =>
    <String, dynamic>{
      'posts': instance.posts,
    };
