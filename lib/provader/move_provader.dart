import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import "../config/config.dart";

class Moveprvader extends ChangeNotifier {
  List<dynamic> _page1 = [];

  List<dynamic> get actionmove => _page1;

  Future<void> fetchMovies() async {
    final response = await http.get(Uri.parse('${config['play_list']}&page=1'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      _page1 = data['results'];
      print(_page1);
      notifyListeners();
    }
  }
}

class Moveprvader4 extends ChangeNotifier {
  List<dynamic> _page4 = [];

  List<dynamic> get actionmove => _page4;

  Future<void> fetchMovies() async {
    final response = await http.get(Uri.parse('${config['play_list']}&page=4'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      _page4 = data['results'];
      print(_page4);
      notifyListeners();
    }
  }
}

class Moveprvader5 extends ChangeNotifier {
  List<dynamic> _page5 = [];

  List<dynamic> get actionmove => _page5;

  Future<void> fetchMovies() async {
    final response = await http.get(Uri.parse('${config['play_list']}&page=5'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      _page5 = data['results'];
      print(_page5);
      notifyListeners();
    }
  }
}

class Moveprvader6 extends ChangeNotifier {
  List<dynamic> _page6 = [];

  List<dynamic> get actionmove => _page6;

  Future<void> fetchMovies() async {
    final response = await http.get(Uri.parse('${config['play_list']}&page=6'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      _page6 = data['results'];
      print(_page6);
      notifyListeners();
    } else {
      throw Exception("failed");
    }
  }
}
