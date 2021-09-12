import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_app/models/theaters_model.dart';

class TheatersProvider with ChangeNotifier {
  Future<List<TheatersModel>> getTheaters() async {
    try {
      var response = await http.get(
        Uri.parse('https://imdb-api.com/en/API/InTheaters/k_jnbsw9k6'),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        List<TheatersModel> theatersFilm = [];
        List parsedJson = (jsonDecode(response.body))["items"];
        parsedJson.forEach((theaters) {
          theatersFilm.add(TheatersModel.fromJson(theaters));
        });
        return theatersFilm;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
