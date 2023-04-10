import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CarpoolFirebaseUser {
  CarpoolFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

CarpoolFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CarpoolFirebaseUser> carpoolFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CarpoolFirebaseUser>(
      (user) {
        currentUser = CarpoolFirebaseUser(user);
        return currentUser!;
      },
    );
