import 'package:debate_circle/Models/Debate.dart';
import 'package:debate_circle/Pages/Home/HomeRouter.dart';
import 'package:debate_circle/Pages/Home/Views/CategoryCarousel.dart';
import 'package:debate_circle/Pages/Home/Views/DebateCarousel.dart';
import 'package:debate_circle/Pages/Home/Views/HomeSectionHeader.dart';
import 'package:debate_circle/Providers/DebateProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final debateProvider = Provider.of<IDebateProvider>(context);
    final router = HomeRouter(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade50,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.blue.shade600,
              size: 32.0,
            ),
            onPressed: router.navigateToCreate,
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 120, bottom: 16.0),
              child: Text(
                "Welcome to Debate Circle",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade900,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: CategoryCarousel(router.navigateToCategory ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: <Widget>[
                  HomeSectionHeader(
                      "Join a Debate", router.navigateToJoinableDebates),
                  FutureBuilder<List<Debate>>(
                    future: debateProvider.joinableDebates,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Debate>> snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return snapshot.hasData
                          ? DebateCarousel(snapshot.data, router.navigateToDebateDetails)
                          : Text("${snapshot.error.toString()}");
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: <Widget>[
                  HomeSectionHeader(
                      "Be the Judge", router.navigateToJudicableDebates),
                  FutureBuilder<List<Debate>>(
                    future: debateProvider.judicableDebates,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Debate>> snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return snapshot.hasData
                          ? DebateCarousel(snapshot.data, router.navigateToDebateDetails)
                          : Text("${snapshot.error.toString()}");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
