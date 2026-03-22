import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islami_app/radio/reciter_response.dart';

class ApiManagerReciter {
  static Future<ReciterResponse> getData() async {
    try {
      Uri uri = Uri.parse('https://www.mp3quran.net/api/v3/reciters');
      var response = await http.get(uri);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ReciterResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
