import 'package:flutter/material.dart';
import 'package:my_movie_app_ui/data/data.dart';
import 'package:my_movie_app_ui/uitls/colors.dart';
import 'package:readmore/readmore.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.65,
                  foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      kBackgroundColor.withOpacity(0.9),
                      kBackgroundColor.withOpacity(0.0),
                    ],
                  )),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(movieModel.imageAsset!),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            movieModel.movieName!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 30),
                          ),
                          Row(
                            children: [
                              Text(
                                movieModel.movieRating!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    height: 0.1),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        movieModel.year!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.white54),
                      ),
                      Row(
                        children: [
                          buildCatagory('Epic'),
                          buildCatagory('Fantasy'),
                          buildCatagory('Drama'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ReadMoreText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip',
                        trimLines: 3,
                        trimMode: TrimMode.Line,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                        moreStyle: TextStyle(color: kButtonColor),
                        lessStyle: TextStyle(color: kButtonColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Cast',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 150,
                        child: buildCast(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Comments',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      SizedBox(
                        height: 200,
                        child: buildComments(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple[800],
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(10),
              child: const Center(
                child: Text(
                  'Watch',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView buildComments() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: movieModel.comments == null ? 0 : movieModel.comments!.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage:
                AssetImage(movieModel.comments![index]['imageUrl']),
          ),
          title: Text(
            movieModel.comments![index]['name'],
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            movieModel.comments![index]['comment'],
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  ListView buildCast() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: movieModel.cast == null ? 0 : movieModel.cast!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  movieModel.cast![index]['image'],
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                movieModel.cast![index]['name'],
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }

  Card buildCatagory(String catagory) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), side: BorderSide.none),
      color: kButtonColor.withOpacity(0.3),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          '$catagory',
          style: const TextStyle(
              fontWeight: FontWeight.w300, color: Colors.white60),
        ),
      ),
    );
  }
}
