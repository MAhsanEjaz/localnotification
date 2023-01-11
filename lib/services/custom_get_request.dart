import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CustomGetRequest {
  Future customGetRequest({required BuildContext context, String? url}) async {
    try {
      http.Response response = await http.get(Uri.parse(url!));

      print('response--->${response.body}');
      print('statusCode--->${response.statusCode}');

      var jsonDecoded = json.decode(response.body);

      if (response.statusCode != 200) {
        return null;
      } else {
        return jsonDecoded;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }
}
