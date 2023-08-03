import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_janitorial/firebase/firebase_repo.dart';

//might be better named SettingsScreenController
class SettingsScreenController extends StateNotifier<AsyncValue<void>> {
  SettingsScreenController({required this.firebase})
      : super(const AsyncValue<void>.data(null));

//andreas rule of thumb...controller should never depend on BuildContexr of anything to do with the UI

  final FirebaseRepo firebase;

  Future<void> signOut() async {
    try {
      state = const AsyncValue.loading();
      await firebase.signOut();
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final settingsScreenControllerProvider = StateNotifierProvider.autoDispose<
    SettingsScreenController, AsyncValue<void>>((ref) {
  final fBRepo = ref.watch(FirebaseRepoProvider);
  return SettingsScreenController(firebase: fBRepo);
});
