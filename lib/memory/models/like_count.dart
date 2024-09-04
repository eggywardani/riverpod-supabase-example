import 'package:memeories_app/auth/auth.dart';
import 'package:memeories_app/memory/memory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_count.g.dart';

@riverpod
Stream<LikeInfo> likeCount(LikeCountRef ref, Memory data) async* {
  final stream = ref.read(memoryRepositoryProvider).likes;
  final user = ref.watch(authUserProvider).asData?.value;
  await for (final likes in stream) {
    yield LikeInfo(
        liked: likes.any((element) =>
            element['memory_id'] == data.id &&
            element['profile_id'] == user?.id),
        count: likes.where((like) => like['memory_id'] == data.id).length);
  }
}
