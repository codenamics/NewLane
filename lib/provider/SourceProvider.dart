import 'package:flutter/material.dart';

import 'package:headlines/models/SourceModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SourceProvider with ChangeNotifier {
  var url =
      'https://newsapi.org/v2/sources?country=us&apiKey=5dba100e14914809983c32d8f26c3740';
  List<Source> _sources = [];

  List<Source> get sources {
    return [..._sources];
  }

  Future<void> getSources() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      _sources = SourceModel.fromJson(jsonResponse).sources;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    notifyListeners();
  }

}
