import 'package:debate_circle/Models/Debate.dart';
import 'package:debate_circle/Providers/AuthProvider.dart';
import 'package:debate_circle/Services/DebateService.dart';
import 'package:flutter/material.dart';

abstract class IDebateProvider extends ChangeNotifier {
  Future<List<Debate>> get judicableDebates;
  Future<void> refreshJudicableDebates();

  Future<List<Debate>> get joinableDebates;
  Future<void> refreshJoinableDebates();
}

class DebateProvider extends IDebateProvider {
  final IDebateService _debateService = DebateService();
  final IAuthProvider _authProvider;

  List<Debate> _joinableDebates;
  List<Debate> _judicableDebates;

  DebateProvider(this._authProvider) {
    notifyListeners();
  }

// GETTERS
  Future<List<Debate>> get judicableDebates async {
    if (_judicableDebates == null) {
      final debates = await _fetchJudicableDebates();
      _judicableDebates = debates;
    }
    return _judicableDebates;
  }

  Future<List<Debate>> get joinableDebates async {
    if (_joinableDebates == null) {
      final debates = await _fetchJoinableDebates();
      _joinableDebates = debates;
    }
    return _joinableDebates;
  }

// PROTOCOL METHODS
  Future<void> refreshJudicableDebates() async {
    final debates = await _fetchJudicableDebates();
    _judicableDebates = debates;
    notifyListeners();
  }

  Future<void> refreshJoinableDebates() async {
    final debates = await _fetchJoinableDebates();
    _joinableDebates = debates;
    notifyListeners();
  }


// PRIVATE METHODS
  Future<List<Debate>> _fetchJudicableDebates() async {
    try {
      final user = await _authProvider.currentUser;
      final idToken = await user.getIdToken();
      return await _debateService.fetchJudicableDebates(idToken.token);
    } catch (e) { print(e); }
  }

  Future<List<Debate>> _fetchJoinableDebates() async {
    try {
      final user = await _authProvider.currentUser;
      final idToken = await user.getIdToken();
      return await _debateService.fetchJoinableDebates(idToken.token);
    } catch (e) { print(e); }
  }
}