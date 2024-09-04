import 'package:freezed_annotation/freezed_annotation.dart';

part 'memory.freezed.dart';
part 'memory.g.dart';

String _profileId(Map json, _) => json['profiles']['id'];
String _username(Map json, _) => json['profiles']['username'];

@freezed
class Memory with _$Memory {
  const factory Memory({
    required int id,
    required String title,
    @JsonKey(name: 'image_id') required String imageId,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(readValue: _profileId) required String profileId,
    @JsonKey(readValue: _username) required String username,
  }) = _Memory;

  factory Memory.fromJson(Map<String, dynamic> json) => _$MemoryFromJson(json);
}
