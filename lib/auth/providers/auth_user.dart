import 'package:memeories_app/auth/api/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_user.g.dart';

@riverpod
Stream<User?> authUser(AuthUserRef ref) async* {
  final stream = ref.watch(authRepositoryProvider).authState;
  await for (final authState in stream) {
    yield authState.session?.user;
  }
}
