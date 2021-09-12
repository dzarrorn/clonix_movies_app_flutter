import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_app/models/popular_model.dart';

class PopularProvider with ChangeNotifier {
  Future<List<PopularModel>> getPopular() async {
    try {
      var response = await http.get(
        Uri.parse('https://imdb-api.com/en/API/MostPopularMovies/k_jnbsw9k6'),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        List<PopularModel> popularFilm = [];
        List parsedJson = (jsonDecode(response.body))["items"];
        parsedJson.forEach((popular) {
          popularFilm.add(PopularModel.fromJson(popular));
        });
        return popularFilm;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
