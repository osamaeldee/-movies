import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:move/config/config.dart';

class Moveprvader3 extends ChangeNotifier {
  List<dynamic> _page3 = [];

  List<dynamic> get actionmove => _page3;

  Future<void> Movies() async {
    final response = await http.get(Uri.parse('${config['play_list']}&page=3'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      _page3 = data['results'];
      print(_page3);
      notifyListeners();
    }
  }
}
