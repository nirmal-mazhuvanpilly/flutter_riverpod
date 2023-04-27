import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod_example/model/passengers/passengers_model.dart';

import 'package:http/http.dart' as http;

abstract class BaseServices {
  Future<PassengersModel?> getPassengers({int? page});
}

class ApiServices implements BaseServices {
  @override
  Future<PassengersModel?> getPassengers({int? page = 0}) async {
    final String baseUrl =
        "https://api.instantwebtools.net/v1/passenger?page=$page&size=10";
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return PassengersModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load passengers data");
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
