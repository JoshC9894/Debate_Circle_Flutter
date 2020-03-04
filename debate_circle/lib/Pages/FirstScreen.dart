import 'package:debate_circle/Pages/LoginPage.dart';
import 'package:debate_circle/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<IAuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.power_settings_new),
          onPressed: () => _signOut(context),
        ),
      ),
      body: Center(
        child: FutureBuilder<String>(
            future: provider.talkToAPI(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return _getBody(snapshot);
            }),
      ),
    );
  }

  Widget _getBody(AsyncSnapshot<String> snapshot) {
    if (snapshot.connectionState != ConnectionState.done) {
      return Center(child: CircularProgressIndicator());
    }
    return !snapshot.hasData ? Text("Null") : Text(snapshot.data);
  }

  Future<void> _signOut(BuildContext context) async {
    final provider = Provider.of<IAuthProvider>(context);
    await provider.signOutOfGoogle();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return LoginPage();
      }),
    );
  }
}
