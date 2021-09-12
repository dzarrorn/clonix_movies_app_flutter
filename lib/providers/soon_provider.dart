import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:netflix_app/models/soon_model.dart';
import 'package:http/http.dart' as http;

class SoonProvider with ChangeNotifier {
  Future<List<SoonModel>> getSoon() async {
    try {
      var response = await http.get(
        Uri.parse('https://imdb-api.com/en/API/ComingSoon/k_jnbsw9k6'),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        List<SoonModel> soonFilm = [];
        List parsedJson = (jsonDecode(response.body))["items"];
        parsedJson.forEach((soon) {
          soonFilm.add(SoonModel.fromJson(soon));
        });
        return soonFilm;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
