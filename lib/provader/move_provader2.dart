import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:move/config/config.dart';

class Moveprvader2 extends ChangeNotifier {
  List<dynamic> _page2 = [];

  List<dynamic> get actionmoveise => _page2;

  Future<void> fetchMoves() async {
    final response =
        await http.get(Uri.parse('${config['play_list']}US&page=2'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      _page2 = data['results'];
      print(_page2);
      notifyListeners();
    }
  }
}
