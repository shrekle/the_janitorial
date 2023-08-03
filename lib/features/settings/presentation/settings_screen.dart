import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_janitorial/firebase/settings_screen_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
//

    ref.listen(
      settingsScreenControllerProvider,
      (previous, next) {
        if (!next.isLoading || next.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.error.toString()),
            ),
          );
        }
      },
    );

    final authFBProvider = ref.watch(settingsScreenControllerProvider);

//set up a listener for when there is an error signing out or deletin account

    return Center(
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              authFBProvider.isLoading ? null : () {};
              ref.read(settingsScreenControllerProvider.notifier).signOut();
            },
            icon: const Icon(Icons.logout),
            label: authFBProvider.isLoading
                ? const Text('Loggin out...')
                : const Text('Logout'),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.sentiment_very_dissatisfied_outlined),
            label: const Text('Delete Account'),
          )
        ],
      ),
    );
  }
}
