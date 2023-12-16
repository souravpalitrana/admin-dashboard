// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: "active")
  int get active => throw _privateConstructorUsedError;
  @JsonKey(name: "cover_img_url")
  String get coverImageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "post_web_url")
  String get postWebUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "post_mobile_url")
  String get postMobileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "view_count")
  int get viewCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "date") String date,
      @JsonKey(name: "active") int active,
      @JsonKey(name: "cover_img_url") String coverImageUrl,
      @JsonKey(name: "post_web_url") String postWebUrl,
      @JsonKey(name: "post_mobile_url") String postMobileUrl,
      @JsonKey(name: "view_count") int viewCount});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? active = null,
    Object? coverImageUrl = null,
    Object? postWebUrl = null,
    Object? postMobileUrl = null,
    Object? viewCount = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      postWebUrl: null == postWebUrl
          ? _value.postWebUrl
          : postWebUrl // ignore: cast_nullable_to_non_nullable
              as String,
      postMobileUrl: null == postMobileUrl
          ? _value.postMobileUrl
          : postMobileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$_PostCopyWith(_$_Post value, $Res Function(_$_Post) then) =
      __$$_PostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") String title,
      @JsonKey(name: "description") String description,
      @JsonKey(name: "date") String date,
      @JsonKey(name: "active") int active,
      @JsonKey(name: "cover_img_url") String coverImageUrl,
      @JsonKey(name: "post_web_url") String postWebUrl,
      @JsonKey(name: "post_mobile_url") String postMobileUrl,
      @JsonKey(name: "view_count") int viewCount});
}

/// @nodoc
class __$$_PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res, _$_Post>
    implements _$$_PostCopyWith<$Res> {
  __$$_PostCopyWithImpl(_$_Post _value, $Res Function(_$_Post) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? active = null,
    Object? coverImageUrl = null,
    Object? postWebUrl = null,
    Object? postMobileUrl = null,
    Object? viewCount = null,
  }) {
    return _then(_$_Post(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      postWebUrl: null == postWebUrl
          ? _value.postWebUrl
          : postWebUrl // ignore: cast_nullable_to_non_nullable
              as String,
      postMobileUrl: null == postMobileUrl
          ? _value.postMobileUrl
          : postMobileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: null == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post with DiagnosticableTreeMixin implements _Post {
  _$_Post(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "title") required this.title,
      @JsonKey(name: "description") required this.description,
      @JsonKey(name: "date") required this.date,
      @JsonKey(name: "active") required this.active,
      @JsonKey(name: "cover_img_url") required this.coverImageUrl,
      @JsonKey(name: "post_web_url") this.postWebUrl = "",
      @JsonKey(name: "post_mobile_url") required this.postMobileUrl,
      @JsonKey(name: "view_count") this.viewCount = 1});

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "description")
  final String description;
  @override
  @JsonKey(name: "date")
  final String date;
  @override
  @JsonKey(name: "active")
  final int active;
  @override
  @JsonKey(name: "cover_img_url")
  final String coverImageUrl;
  @override
  @JsonKey(name: "post_web_url")
  final String postWebUrl;
  @override
  @JsonKey(name: "post_mobile_url")
  final String postMobileUrl;
  @override
  @JsonKey(name: "view_count")
  final int viewCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Post(id: $id, title: $title, description: $description, date: $date, active: $active, coverImageUrl: $coverImageUrl, postWebUrl: $postWebUrl, postMobileUrl: $postMobileUrl, viewCount: $viewCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Post'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('active', active))
      ..add(DiagnosticsProperty('coverImageUrl', coverImageUrl))
      ..add(DiagnosticsProperty('postWebUrl', postWebUrl))
      ..add(DiagnosticsProperty('postMobileUrl', postMobileUrl))
      ..add(DiagnosticsProperty('viewCount', viewCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Post &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.postWebUrl, postWebUrl) ||
                other.postWebUrl == postWebUrl) &&
            (identical(other.postMobileUrl, postMobileUrl) ||
                other.postMobileUrl == postMobileUrl) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, date,
      active, coverImageUrl, postWebUrl, postMobileUrl, viewCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostCopyWith<_$_Post> get copyWith =>
      __$$_PostCopyWithImpl<_$_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(
      this,
    );
  }
}

abstract class _Post implements Post {
  factory _Post(
      {@JsonKey(name: "id") final int? id,
      @JsonKey(name: "title") required final String title,
      @JsonKey(name: "description") required final String description,
      @JsonKey(name: "date") required final String date,
      @JsonKey(name: "active") required final int active,
      @JsonKey(name: "cover_img_url") required final String coverImageUrl,
      @JsonKey(name: "post_web_url") final String postWebUrl,
      @JsonKey(name: "post_mobile_url") required final String postMobileUrl,
      @JsonKey(name: "view_count") final int viewCount}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "description")
  String get description;
  @override
  @JsonKey(name: "date")
  String get date;
  @override
  @JsonKey(name: "active")
  int get active;
  @override
  @JsonKey(name: "cover_img_url")
  String get coverImageUrl;
  @override
  @JsonKey(name: "post_web_url")
  String get postWebUrl;
  @override
  @JsonKey(name: "post_mobile_url")
  String get postMobileUrl;
  @override
  @JsonKey(name: "view_count")
  int get viewCount;
  @override
  @JsonKey(ignore: true)
  _$$_PostCopyWith<_$_Post> get copyWith => throw _privateConstructorUsedError;
}
