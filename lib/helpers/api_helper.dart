import 'dart:convert';

import 'package:harry_potter_api/helpers/constants.dart';
import 'package:harry_potter_api/models/character.dart';
import 'package:harry_potter_api/models/response.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static Future<Response> getCharacters() async {
    var url = Uri.parse(Constants.apiUrl);

    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );

    var body = response.body;

    if (response.statusCode >= 400) {
      return Response(isSuccess: false, message: body);
    }

    List<Character> list = [];
    var decodedJson = jsonDecode(body);

    if (decodedJson != null) {
      for (var item in decodedJson) {
        list.add(Character.fromJson(item));
      }
    }

    return Response(isSuccess: true, result: list);
  }
}
