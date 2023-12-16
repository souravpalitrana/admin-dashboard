// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_by_date_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostByDateRequest _$PostByDateRequestFromJson(Map<String, dynamic> json) {
  return _PostByDateRequest.fromJson(json);
}

/// @nodoc
mixin _$PostByDateRequest {
  String get date => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;
  @JsonKey(name: "is_fresh_data_required")
  bool get isFreshDataRequired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostByDateRequestCopyWith<PostByDateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostByDateRequestCopyWith<$Res> {
  factory $PostByDateRequestCopyWith(
          PostByDateRequest value, $Res Function(PostByDateRequest) then) =
      _$PostByDateRequestCopyWithImpl<$Res, PostByDateRequest>;
  @useResult
  $Res call(
      {String date,
      int max,
      @JsonKey(name: "is_fresh_data_required") bool isFreshDataRequired});
}

/// @nodoc
class _$PostByDateRequestCopyWithImpl<$Res, $Val extends PostByDateRequest>
    implements $PostByDateRequestCopyWith<$Res> {
  _$PostByDateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? max = null,
    Object? isFreshDataRequired = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      isFreshDataRequired: null == isFreshDataRequired
          ? _value.isFreshDataRequired
          : isFreshDataRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostByDateRequestCopyWith<$Res>
    implements $PostByDateRequestCopyWith<$Res> {
  factory _$$_PostByDateRequestCopyWith(_$_PostByDateRequest value,
          $Res Function(_$_PostByDateRequest) then) =
      __$$_PostByDateRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String date,
      int max,
      @JsonKey(name: "is_fresh_data_required") bool isFreshDataRequired});
}

/// @nodoc
class __$$_PostByDateRequestCopyWithImpl<$Res>
    extends _$PostByDateRequestCopyWithImpl<$Res, _$_PostByDateRequest>
    implements _$$_PostByDateRequestCopyWith<$Res> {
  __$$_PostByDateRequestCopyWithImpl(
      _$_PostByDateRequest _value, $Res Function(_$_PostByDateRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? max = null,
    Object? isFreshDataRequired = null,
  }) {
    return _then(_$_PostByDateRequest(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      isFreshDataRequired: null == isFreshDataRequired
          ? _value.isFreshDataRequired
          : isFreshDataRequired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostByDateRequest
    with DiagnosticableTreeMixin
    implements _PostByDateRequest {
  _$_PostByDateRequest(
      {required this.date,
      required this.max,
      @JsonKey(name: "is_fresh_data_required")
      this.isFreshDataRequired = true});

  factory _$_PostByDateRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PostByDateRequestFromJson(json);

  @override
  final String date;
  @override
  final int max;
  @override
  @JsonKey(name: "is_fresh_data_required")
  final bool isFreshDataRequired;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostByDateRequest(date: $date, max: $max, isFreshDataRequired: $isFreshDataRequired)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostByDateRequest'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('max', max))
      ..add(DiagnosticsProperty('isFreshDataRequired', isFreshDataRequired));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostByDateRequest &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.isFreshDataRequired, isFreshDataRequired) ||
                other.isFreshDataRequired == isFreshDataRequired));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, max, isFreshDataRequired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostByDateRequestCopyWith<_$_PostByDateRequest> get copyWith =>
      __$$_PostByDateRequestCopyWithImpl<_$_PostByDateRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostByDateRequestToJson(
      this,
    );
  }
}

abstract class _PostByDateRequest implements PostByDateRequest {
  factory _PostByDateRequest(
      {required final String date,
      required final int max,
      @JsonKey(name: "is_fresh_data_required")
      final bool isFreshDataRequired}) = _$_PostByDateRequest;

  factory _PostByDateRequest.fromJson(Map<String, dynamic> json) =
      _$_PostByDateRequest.fromJson;

  @override
  String get date;
  @override
  int get max;
  @override
  @JsonKey(name: "is_fresh_data_required")
  bool get isFreshDataRequired;
  @override
  @JsonKey(ignore: true)
  _$$_PostByDateRequestCopyWith<_$_PostByDateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
