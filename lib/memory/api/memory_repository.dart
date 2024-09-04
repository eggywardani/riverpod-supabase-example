import 'dart:io';

import 'package:memeories_app/memory/models/memory.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'memory_repository.g.dart';

@riverpod
MemoryRepository memoryRepository(MemoryRepositoryRef _) => MemoryRepository();

class MemoryRepository {
  final _client = Supabase.instance.client;
  String get storageUrl => _client.storage.url;
  RealtimeChannel get memoryChannel => _client.channel('public:memories');

  Future<List<Memory>> getMemories() => _client
      .from('memories')
      .select('id, title, created_at, image_id, profiles (id, username)')
      .order('created_at')
      .then((value) => value.map((e) => Memory.fromJson(e)).toList());

  Future<void> addMemory({required String title, required File file}) async {
    final profileId = _client.auth.currentUser?.id;
    final imageId = file.path.split('/').last;

    if (profileId == null) {
      throw 'Missing Profile';
    }

    await _client
        .from('memories')
        .insert({'title': title, 'image_id': imageId, 'profile_id': profileId});

    await _client.storage.from('memories').upload('$profileId/$imageId', file);
  }

  Future<void> updateMemory({required int id, required String title}) async {
    final profileId = _client.auth.currentUser?.id;

    if (profileId == null) {
      throw 'Missing Profile';
    }

    await _client
        .from('memories')
        .update({'title': title})
        .eq('id', id)
        .eq('profile_id', profileId);
  }

  Future<void> deleteMemory({required Memory data}) async {
    final profileId = _client.auth.currentUser?.id;
    final imageId = data.imageId;
    if (profileId == null) {
      throw 'Missing Profile';
    }

    await _client.storage.from('memories').remove(['$profileId/$imageId']);
    await _client
        .from('memories')
        .delete()
        .eq('id', data.id)
        .eq('profile_id', profileId);
  }

  Stream<List<Map<String, dynamic>>> get likes =>
      _client.from('likes').stream(primaryKey: ['id']);

  Future<void> addLike({required int id}) async {
    final profileId = _client.auth.currentUser?.id;
    await _client.from('likes').insert({
      'memory_id': id,
      'profile_id': profileId,
    });
  }

  Future<void> removeLike({required int id}) async {
    final profileId = _client.auth.currentUser?.id;
    if (profileId == null) {
      throw 'Missing Profile';
    }
    await _client
        .from('likes')
        .delete()
        .eq('memory_id', id)
        .eq('profile_id', profileId);
  }
}
