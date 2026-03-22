import 'dart:convert';

import 'package:islami_app/radio/radio_response.dart';
import 'package:http/http.dart' as http;

class ApiManagerRadio {
  static Future<RadioResponse> getData()async {
    try {
      Uri uri = Uri.parse('https://mp3quran.net/api/v3/radios?language=ar');
      var response = await http.get(uri);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return RadioResponse.fromJson(json);
    } catch(e) {
      rethrow;
    }
  }
}