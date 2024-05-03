import 'package:flutter/material.dart';
import 'package:move/provader/move_provader.dart';
import 'package:move/provader/move_provader2.dart';
import 'package:move/provader/move_provader3.dart';
import 'package:move/widgets/genre.dart';
import 'package:move/widgets/header.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Provider.of<Moveprvader>(context).fetchMovies();
    Provider.of<Moveprvader2>(context).fetchMoves();
    Provider.of<Moveprvader3>(context).Movies();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Genre(
              title: 'section One',
              movias: Provider.of<Moveprvader>(context).actionmove,
            ),
            Genre(
              title: 'section Two',
              movias: Provider.of<Moveprvader2>(context).actionmoveise,
            ),
            Genre(
              title: 'section Three',
              movias: Provider.of<Moveprvader3>(context).actionmove,
            ),
          ],
        ),
      ),
    );
  }
}
