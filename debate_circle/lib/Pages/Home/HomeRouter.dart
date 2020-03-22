import 'package:debate_circle/Models/Debate.dart';
import 'package:debate_circle/Pages/Category%20List/CategoryListPage.dart';
import 'package:debate_circle/Pages/Create%20Debate/CreateDebatePage.dart';
import 'package:debate_circle/Pages/Debate%20Details/DebateDetailsPage.dart';
import 'package:debate_circle/Pages/Joinable%20List/JoinableDebatesPage.dart';
import 'package:debate_circle/Pages/Judicable%20List/JudicableDebatesPage.dart';
import 'package:flutter/material.dart';

abstract class IHomeRouter {
  void navigateToCreate();
  void navigateToJoinableDebates();
  void navigateToJudicableDebates();
  void navigateToCategory(int id);
  void navigateToDebateDetails(Debate debate);
}

class HomeRouter extends IHomeRouter {
  final BuildContext context;

  HomeRouter(this.context);

// Interface Methods
  @override
  void navigateToCreate() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateDebatePage(),
      ),
    );
  }

  @override
  void navigateToJoinableDebates() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JoinableDebatesPage(),
      ),
    );
  }

  @override
  void navigateToJudicableDebates() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => JudicableDebatesPage(),
      ),
    );
  }

  @override
  void navigateToCategory(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryListPage(id),
      ),
    );
  }

  @override
  void navigateToDebateDetails(Debate debate) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DebateDetailsPage(debate),
      ),
    );
  }
}