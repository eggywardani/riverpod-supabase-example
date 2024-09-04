import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef _) => AuthRepository();

class AuthRepository {
  final _client = Supabase.instance.client;

  Stream<AuthState> get authState => _client.auth.onAuthStateChange;

  Future<void> logout() => _client.auth.signOut();
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    return await _client.auth
        .signInWithPassword(password: password, email: email);
  }
}
