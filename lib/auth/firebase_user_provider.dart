import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class VoyaGrFirebaseUser {
  VoyaGrFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

VoyaGrFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<VoyaGrFirebaseUser> voyaGrFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<VoyaGrFirebaseUser>(
      (user) {
        currentUser = VoyaGrFirebaseUser(user);
        return currentUser!;
      },
    );
