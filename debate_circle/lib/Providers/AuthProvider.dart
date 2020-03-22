import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class IAuthProvider extends ChangeNotifier {
  Future<void> signInWithGoogle();
  Future<void> signOutOfGoogle();
  Future<FirebaseUser> get currentUser;
}

class AuthProvider extends IAuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthProvider() {
    notifyListeners();
  }

  Future<FirebaseUser> get currentUser => _auth.currentUser();

  @override
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount _account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication _authentication = await _account.authentication;

    final AuthCredential _creds = GoogleAuthProvider.getCredential(
      idToken: _authentication.idToken,
      accessToken: _authentication.accessToken,
    );

    final AuthResult _result = await _auth.signInWithCredential(_creds);
    final FirebaseUser _user = _result.user;

    assert(!_user.isAnonymous);
    assert(await _user.getIdToken() != null);

    FirebaseUser _currentUser = await _auth.currentUser();
    assert(_user.uid == _currentUser.uid);

    notifyListeners();
  }

  Future<void> signOutOfGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    notifyListeners();
  }
}
