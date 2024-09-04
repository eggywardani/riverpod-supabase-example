import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:memeories_app/memory/memory.dart';

class MemoryListView extends ConsumerWidget {
  const MemoryListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(memoryNotifierProvider);
    return notifier.when(
        data: (data) {
          return MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return MemoryItemView(
                data: data[index],
              );
            },
          );
        },
        error: (e, _) => Center(child: Text(e.toString())),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
