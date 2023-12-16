// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostsResponse _$PostsResponseFromJson(Map<String, dynamic> json) {
  return _PostsResponse.fromJson(json);
}

/// @nodoc
mixin _$PostsResponse {
  @JsonKey(name: "posts")
  List<Post> get posts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostsResponseCopyWith<PostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsResponseCopyWith<$Res> {
  factory $PostsResponseCopyWith(
          PostsResponse value, $Res Function(PostsResponse) then) =
      _$PostsResponseCopyWithImpl<$Res, PostsResponse>;
  @useResult
  $Res call({@JsonKey(name: "posts") List<Post> posts});
}

/// @nodoc
class _$PostsResponseCopyWithImpl<$Res, $Val extends PostsResponse>
    implements $PostsResponseCopyWith<$Res> {
  _$PostsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
  }) {
    return _then(_value.copyWith(
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostsResponseCopyWith<$Res>
    implements $PostsResponseCopyWith<$Res> {
  factory _$$_PostsResponseCopyWith(
          _$_PostsResponse value, $Res Function(_$_PostsResponse) then) =
      __$$_PostsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "posts") List<Post> posts});
}

/// @nodoc
class __$$_PostsResponseCopyWithImpl<$Res>
    extends _$PostsResponseCopyWithImpl<$Res, _$_PostsResponse>
    implements _$$_PostsResponseCopyWith<$Res> {
  __$$_PostsResponseCopyWithImpl(
      _$_PostsResponse _value, $Res Function(_$_PostsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posts = null,
  }) {
    return _then(_$_PostsResponse(
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostsResponse with DiagnosticableTreeMixin implements _PostsResponse {
  _$_PostsResponse({@JsonKey(name: "posts") required final List<Post> posts})
      : _posts = posts;

  factory _$_PostsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PostsResponseFromJson(json);

  final List<Post> _posts;
  @override
  @JsonKey(name: "posts")
  List<Post> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostsResponse(posts: $posts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostsResponse'))
      ..add(DiagnosticsProperty('posts', posts));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostsResponse &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostsResponseCopyWith<_$_PostsResponse> get copyWith =>
      __$$_PostsResponseCopyWithImpl<_$_PostsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostsResponseToJson(
      this,
    );
  }
}

abstract class _PostsResponse implements PostsResponse {
  factory _PostsResponse(
          {@JsonKey(name: "posts") required final List<Post> posts}) =
      _$_PostsResponse;

  factory _PostsResponse.fromJson(Map<String, dynamic> json) =
      _$_PostsResponse.fromJson;

  @override
  @JsonKey(name: "posts")
  List<Post> get posts;
  @override
  @JsonKey(ignore: true)
  _$$_PostsResponseCopyWith<_$_PostsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
