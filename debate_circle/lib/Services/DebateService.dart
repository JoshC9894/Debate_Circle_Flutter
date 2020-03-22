import 'dart:convert';

import 'package:debate_circle/Components/Endpoint.dart';
import 'package:debate_circle/Models/Debate.dart';
import 'package:http/http.dart' as http;

abstract class IDebateService {
  Future<List<Debate>> fetchJudicableDebates(String idToken);
  Future<List<Debate>> fetchJoinableDebates(String idToken);
}

class DebateService implements IDebateService {

  @override
  Future<List<Debate>> fetchJudicableDebates(String idToken) async {
    final headers = { 'Authorization': idToken };
    final response = await http.get(Endpoint.judicableDebates, headers: headers);
    if (response.statusCode == 200) {
      final list = json.decode(response.body);
      List<Debate> _debates = [];
      list.map(($0) => Debate.fromJson($0)).toList().forEach((x) => _debates.add(x));
      return _debates;
    }
    throw Exception("Failed to get judicable debates");
  }

  @override
  Future<List<Debate>> fetchJoinableDebates(String idToken) async {
    final headers = { 'Authorization': idToken };
    final response = await http.get(Endpoint.joinableDebates, headers: headers);
    if (response.statusCode == 200) {
      final list = json.decode(response.body);
      List<Debate> _debates = [];
      list.map(($0) => Debate.fromJson($0)).toList().forEach((x) => _debates.add(x));
      return _debates;
    }
    throw Exception("Failed to get joinable debates");
  }
}