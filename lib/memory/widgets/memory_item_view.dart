import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memeories_app/auth/auth.dart';
import 'package:memeories_app/core/utils.dart';
import 'package:memeories_app/memory/memory.dart';

class MemoryItemView extends ConsumerWidget {
  const MemoryItemView({super.key, required this.data});
  final Memory data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authUserProvider).asData?.value;
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Image.network(
            ref.read(imageUrlProvider(
                userId: data.profileId, filename: data.imageId)),
            fit: BoxFit.cover,
          ),
          Positioned(top: 6, right: 10, child: LikeCount(data: data)),
          if (user != null && user.id == data.profileId)
            Positioned.fill(
              child: Center(
                child: FilledButton(
                    onPressed: () {
                      context.showBottomsheet(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MemoryItemForm(
                          data: data,
                        ),
                      ));
                    },
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    )),
              ),
            ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                data.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                "by ${data.username}",
                style: const TextStyle(
                    color: Colors.white, fontStyle: FontStyle.italic),
              ),
            ),
          )
        ],
      ),
    );
  }
}
