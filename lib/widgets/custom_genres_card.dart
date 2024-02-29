import 'package:flutter/material.dart';
import 'package:my_movie_app_ui/data/data.dart';

class CustomGenresCard extends StatelessWidget {
  const CustomGenresCard({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          width: 280,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              movieModel.imageAsset.toString(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            movieModel.movieName!,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
