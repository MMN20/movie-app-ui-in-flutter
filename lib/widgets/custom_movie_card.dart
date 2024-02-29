import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_movie_app_ui/data/data.dart';
import 'package:my_movie_app_ui/screens/details_screen.dart';
import 'package:my_movie_app_ui/uitls/colors.dart';

class CustomMovieCard extends StatelessWidget {
  const CustomMovieCard({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(movieModel: movieModel),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    kBackgroundColor.withOpacity(0.4),
                    kBackgroundColor.withOpacity(0.0),
                  ]),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  movieModel.imageAsset.toString(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SizedBox(
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movieModel.movieName.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        movieModel.movieRating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              movieModel.year.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
