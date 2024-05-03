import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:move/config/config.dart';
import 'package:move/screens/move.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String title = '';
  String originalTitle = '';
  String releaseDate = '';
  String overview = '';
  String video = '';
  String posterPath = '';
  String original_language = '';
  double voteAverage = 0.0;
  double popularity = 0.0;
  int id = 0;

  Future<void> getYourMovies() async {
    Random random = Random();
    int randomnum = random.nextInt(9);
    final response = await http.get(Uri.parse('${config['play_list']}&page=1'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        title = data['results'][randomnum]['title'];
        originalTitle = data['results'][randomnum]['original_title'];
        original_language = data['results'][randomnum]['original_language'];
        releaseDate = data['results'][randomnum]['release_date'];
        overview = data['results'][randomnum]['overview'];
        popularity = data['results'][randomnum]['popularity'];
        posterPath = data['results'][randomnum]['poster_path'];
        video = data['results'][randomnum]['video'] != null
            ? data['results'][randomnum]['video'].toString()
            : '';
        voteAverage = data['results'][randomnum]['vote_average'];
        id = data['results'][randomnum]['id'];
      });
    } else {
      if (kDebugMode) {
        print('failed');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getYourMovies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => moveDatailse(
              original_language: original_language,
              title: title,
              originalTitle: originalTitle,
              releaseDate: releaseDate,
              overview: overview,
              video: video,
              posterPath: posterPath,
              voteAverage: voteAverage,
              popularity: popularity,
              id: id,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(color: Colors.black),
            child: posterPath == ''
                ? Container()
                : Image.network('https://image.tmdb.org/t/p/w500/$posterPath',
                    fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 500,
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          voteAverage.toString(),
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
