import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_janitorial/firebase/app_user.dart';

class FirebaseRepo {
//
  AppUser? currentUser; //just a placeholder
  bool? _authState;

  Future<void> singInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    if (currentUser == null) {
      _createNewUser(email);
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    if (currentUser == null) {
      _createNewUser(email);
    }
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('done screwed up fool');
    await Future.delayed(const Duration(seconds: 5));
    _authState = null;
  }

  // dispose() => _authState.close();

  _createNewUser(String email) {
    currentUser = AppUser(
      id: '1',
      email: email,
    );
  }
}

final FirebaseRepoProvider = Provider<FirebaseRepo>((ref) {
  //  final auth = FirebaseRepo();
  // ref.onDispose(() => auth.dispose());
  // return auth;
  return FirebaseRepo();
});
