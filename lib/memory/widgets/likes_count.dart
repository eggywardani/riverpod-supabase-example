import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memeories_app/auth/auth.dart';
import 'package:memeories_app/memory/models/like_count.dart';

import '../memory.dart';

class LikeCount extends ConsumerWidget {
  const LikeCount({super.key, required this.data});
  final Memory data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likesCount = ref.watch(likeCountProvider(data));
    final info = likesCount.asData?.value;
    final likes = info?.count ?? 0;
    final user = ref.watch(authUserProvider).asData?.value;
    return SizedBox(
      width: 60,
      child: FilledButton(
        onPressed: user == null || likesCount.isLoading
            ? null
            : () {
                final act = ref.read(memoryRepositoryProvider);
                if (info?.liked == true) {
                  act.removeLike(id: data.id);
                } else {
                  act.addLike(id: data.id);
                }
              },
        style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
            backgroundColor: MaterialStatePropertyAll(Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite,
              size: 20,
              color: info?.liked ?? false ? Colors.pink : Colors.white,
            ),
            const SizedBox(
              width: 4,
            ),
            Flexible(
                child: Text(
              '$likes',
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
