import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> getUID() async {
    return (await _firebaseAuth.currentUser).uid;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async{
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";

    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp ({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return "Signed up";
    } on FirebaseException catch (e) {
      return e.message;
    }
  }
}