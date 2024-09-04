import 'package:freezed_annotation/freezed_annotation.dart';

part 'like_info.freezed.dart';

@freezed
class LikeInfo with _$LikeInfo {
  const factory LikeInfo({
    required bool liked,
    required int count,
  }) = _LikeInfo;
}
