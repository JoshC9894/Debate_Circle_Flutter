import 'dart:core';

class Endpoint {
  // static String _baseUrl = "http://localhost:5001/debate-circle-adc5e/us-central1/api";
  static String _baseUrl = "https://us-central1-debate-circle-adc5e.cloudfunctions.net/api";

  static String judicableDebates = "$_baseUrl/debate/judicable";
  static String joinableDebates = "$_baseUrl/debate/joinable";
}