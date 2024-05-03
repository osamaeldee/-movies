import 'package:flutter/material.dart';
import 'package:move/screens/move.dart';

class Genre extends StatelessWidget {
  final String title;
  final List movias;
  const Genre({Key? key, required this.title, required this.movias})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movias.length,
              itemBuilder: (context, i) {
                final item = movias[i];
                final posterPath = item['poster_path'];
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => moveDatailse(
                            original_language: item['original_language'],
                            title: item['title'],
                            originalTitle: item['original_title'],
                            releaseDate: item['release_date'],
                            overview: item['overview'],
                            video: item['video'] != null
                                ? item['video'].toString()
                                : '',
                            posterPath: posterPath,
                            voteAverage: item['popularity'],
                            popularity: item['vote_average'],
                            id: item['id'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.red,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/$posterPath',
                        cacheHeight: 300,
                        cacheWidth: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
