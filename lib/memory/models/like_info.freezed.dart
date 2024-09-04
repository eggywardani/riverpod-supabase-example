// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LikeInfo {
  bool get liked => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikeInfoCopyWith<LikeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeInfoCopyWith<$Res> {
  factory $LikeInfoCopyWith(LikeInfo value, $Res Function(LikeInfo) then) =
      _$LikeInfoCopyWithImpl<$Res, LikeInfo>;
  @useResult
  $Res call({bool liked, int count});
}

/// @nodoc
class _$LikeInfoCopyWithImpl<$Res, $Val extends LikeInfo>
    implements $LikeInfoCopyWith<$Res> {
  _$LikeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liked = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LikeInfoImplCopyWith<$Res>
    implements $LikeInfoCopyWith<$Res> {
  factory _$$LikeInfoImplCopyWith(
          _$LikeInfoImpl value, $Res Function(_$LikeInfoImpl) then) =
      __$$LikeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool liked, int count});
}

/// @nodoc
class __$$LikeInfoImplCopyWithImpl<$Res>
    extends _$LikeInfoCopyWithImpl<$Res, _$LikeInfoImpl>
    implements _$$LikeInfoImplCopyWith<$Res> {
  __$$LikeInfoImplCopyWithImpl(
      _$LikeInfoImpl _value, $Res Function(_$LikeInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liked = null,
    Object? count = null,
  }) {
    return _then(_$LikeInfoImpl(
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LikeInfoImpl implements _LikeInfo {
  const _$LikeInfoImpl({required this.liked, required this.count});

  @override
  final bool liked;
  @override
  final int count;

  @override
  String toString() {
    return 'LikeInfo(liked: $liked, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LikeInfoImpl &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hash(runtimeType, liked, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LikeInfoImplCopyWith<_$LikeInfoImpl> get copyWith =>
      __$$LikeInfoImplCopyWithImpl<_$LikeInfoImpl>(this, _$identity);
}

abstract class _LikeInfo implements LikeInfo {
  const factory _LikeInfo(
      {required final bool liked, required final int count}) = _$LikeInfoImpl;

  @override
  bool get liked;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$LikeInfoImplCopyWith<_$LikeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
