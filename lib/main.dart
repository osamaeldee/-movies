import 'package:flutter/material.dart';
import 'package:move/provader/move_provader3.dart';
import 'package:provider/provider.dart';
import 'package:move/provader/move_provader.dart';
import 'package:move/provader/move_provader2.dart';

import 'screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Moveprvader()),
        ChangeNotifierProvider(create: (_) => Moveprvader3()),
        ChangeNotifierProvider(create: (_) => Moveprvader2()),
      ],
      child: MaterialApp(
        title: 'Your App',
        theme: ThemeData(),
        home: Homescreen(),
      ),
    );
  }
}
