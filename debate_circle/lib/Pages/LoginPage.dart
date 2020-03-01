import 'dart:developer';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton(
              color: Colors.white,
      onPressed: _loginWithGoogle,
      child: Text("Login with Google"),
    )));
  }

  Future<void> _loginWithGoogle() {
    print("Login with Google");
  }
}
