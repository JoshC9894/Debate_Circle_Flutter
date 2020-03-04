import 'package:debate_circle/Pages/FirstScreen.dart';
import 'package:debate_circle/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : RaisedButton(
                onPressed: () => _loginWithGoogle(context),
                child: Text("Sign in with Google")),
      ),
    );
  }

  Future<void> _loginWithGoogle(BuildContext context) async {
    final _provider = Provider.of<IAuthProvider>(context);
    setState(() {
      _isLoading = true;
    });
    await _provider.signInWithGoogle();
    setState(() {
      _isLoading = false;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return FirstScreen();
      }),
    );
  }
}
