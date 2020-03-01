import 'package:debate_circle/Pages/LoginPage.dart';
import 'package:debate_circle/Providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<IAuthProvider>(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Debate Circle",
        home: LoginPage(),
      ),
    );
  }
}
