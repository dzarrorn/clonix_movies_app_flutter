import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_app/models/asian_model.dart';

class AsianProvider with ChangeNotifier {
  Future<List<AsianModel>> getAsian() async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://imdb-api.com/en/API/IMDbList/k_jnbsw9k6/ls004285275'),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        List<AsianModel> asianFilm = [];
        List parsedJson = (jsonDecode(response.body))["items"];
        parsedJson.forEach((asian) {
          asianFilm.add(AsianModel.fromJson(asian));
        });
        return asianFilm;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
