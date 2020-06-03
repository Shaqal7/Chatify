import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';

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
      AuthResult _result = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      user = _result.user;
      status = AuthStatus.Authenticated;
      print('Logged In Successfully');
      // TODO: navigate to HomePage
    } catch(e) {

    }
  }
}