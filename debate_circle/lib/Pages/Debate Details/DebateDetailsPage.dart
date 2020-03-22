import 'package:debate_circle/Models/Debate.dart';
import 'package:flutter/material.dart';

class DebateDetailsPage extends StatelessWidget {
  final Debate _debate;
  DebateDetailsPage(this._debate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_debate.title),
      ),
      body: Center(
        child: Text(_debate.title),
      ),
    );
  }
}
