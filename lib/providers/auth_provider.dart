import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/snackbar_service.dart';

enum AuthStatus {
  NotAuthenticated,
  Authenticating,
  Authenticated,
  UserNotFound,
  Error,
}

class AuthProvider extends ChangeNotifier{

  FirebaseUser user;
  AuthStatus status;

  FirebaseAuth _auth;

  static AuthProvider instance = AuthProvider();

  AuthProvider(){
    _auth = FirebaseAuth.instance;
  }

  void loginUserWithEmailAndPassword(String _email, String _password) async{
    status = AuthStatus.Authenticating;
    notifyListeners();
    try{
      AuthResult _result = await _auth.signInWithEmailAndPassword(
          email: _email, password: _password
      );
      user = _result.user;
      status = AuthStatus.Authenticated;
      SnackBarService.instance.showSnackBarSuccess("Welcome, ${user.email}");
      // TODO: navigate to HomePage
    } catch(e) {
      status = AuthStatus.Error;
      SnackBarService.instance.showSnackBarError("Error Authenticating");
      // TODO: Display an error
    }
    notifyListeners();
  }
}