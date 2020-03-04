import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class IDebateService {
  Future<String> talkToApi(String idToken);
}

class DebateService implements IDebateService {
  @override
  Future<String> talkToApi(String idToken) async {
    final url = "http://localhost:5001/debate-circle-adc5e/us-central1/api/test";
    // final url = "https://us-central1-debate-circle-adc5e.cloudfunctions.net/api/test";
    final headers = {'Authorization': idToken};
    final response = await http.get(url, headers: headers); // handle exception here
    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      return map["name"];
      // Iterable list = json.decode(response.body);
      // return list.map(($0) => Appliance.fromJson($0)).toList();
    }
    throw Exception("Failed To Get Insepctions");
  }
}