import 'package:go_router/go_router.dart';
import 'package:memeories_app/auth/auth.dart';
import 'package:memeories_app/memory/memory.dart';
import 'package:memeories_app/onboarding/onboarding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes.g.dart';

@riverpod
dynamic route(RouteRef ref) => _routes;

final _routes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MemoryPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/verification',
      builder: (context, state) {
        final params = state.extra as VerificationPageParams?;
        if (params == null) {
          throw 'Missing `VerificationPageParams`';
        }
        return VerificationPage(
          params: params,
        );
      },
    ),
  ],
);
