import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memeories_app/auth/api/auth_repository.dart';
import 'package:memeories_app/auth/providers/auth_user.dart';
import 'package:memeories_app/core/utils.dart';
import 'package:memeories_app/memory/memory.dart';

class MemoryPage extends ConsumerWidget {
  const MemoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authUserProvider).asData?.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memories App'),
        actions: [
          if (user != null)
            IconButton(
              onPressed: () {
                ref.read(authRepositoryProvider).logout();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
            ),
        ],
      ),
      floatingActionButton: user == null
          ? null
          : FloatingActionButton(
              onPressed: () => context.showBottomsheet(
                  child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: MemoryItemForm(),
              )),
              child: const Icon(Icons.add),
            ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const Positioned.fill(child: MemoryListView()),
            if (user == null)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: FilledButton(
                  onPressed: () {
                    context.push('/login');
                  },
                  child: const Text('Login to the app'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
