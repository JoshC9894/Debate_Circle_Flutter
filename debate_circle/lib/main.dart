import 'package:debate_circle/Pages/FirstScreen.dart';
import 'package:debate_circle/Pages/LoginPage.dart';
import 'package:debate_circle/Providers/AuthProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<IAuthProvider>(
            create: (context) => AuthProvider(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<IAuthProvider>(context);
    return MaterialApp(
      title: "Debate Circle",
      home: FutureBuilder(
        future: _provider.currentUser,
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          return _getBody(snapshot);
        },
      ),
    );
  }

  Widget _getBody(AsyncSnapshot<FirebaseUser> snapshot) {
    if (snapshot.connectionState != ConnectionState.done) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (snapshot.error != null) {
      return Scaffold(body: Center(child: Text(snapshot.error.toString())));
    }
    return snapshot.data == null ? LoginPage() : FirstScreen();
  }
}