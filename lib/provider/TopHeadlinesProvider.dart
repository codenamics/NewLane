import 'package:flutter/material.dart';
import 'package:headlines/models/ArticlesModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class TopHeadlinesProvider with ChangeNotifier {
  var url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=5dba100e14914809983c32d8f26c3740';
  List<Article> _topHeadlines = [];

  List<Article> get topHeadlines {
    return [..._topHeadlines];
  }

  Future<void> getHeadLines() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      _topHeadlines = ArticlesModel.fromJson(jsonResponse).articles;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    notifyListeners();
  }

}
