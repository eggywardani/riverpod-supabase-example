import 'package:memeories_app/memory/api/memory_repository.dart';
import 'package:memeories_app/memory/models/memory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'memory_notifier.g.dart';

@riverpod
class MemoryNotifier extends _$MemoryNotifier {
  @override
  Future<List<Memory>> build() async {
    _initMemoryChannel();
    return ref.read(memoryRepositoryProvider).getMemories();
  }

  _initMemoryChannel() {
    ref
        .read(memoryRepositoryProvider)
        .memoryChannel
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'memories',
          callback: (payload) async {
            print('Change received: ${payload.toString()}');
            state = await AsyncValue.guard(
                () => ref.read(memoryRepositoryProvider).getMemories());
          },
        )
        .subscribe();
  }
}
