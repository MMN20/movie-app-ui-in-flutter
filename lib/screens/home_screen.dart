import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_movie_app_ui/data/data.dart';
import 'package:my_movie_app_ui/uitls/colors.dart';
import 'package:my_movie_app_ui/widgets/custom_movie_card.dart';
import 'package:my_movie_app_ui/widgets/custom_genres_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<MovieModel> forYouItems = List.of(forYouImages);
  List<MovieModel> popularMovies = List.of(popularImages);
  List<MovieModel> myGenreList = List.of(genresList);
  List<MovieModel> legendaryMovies = List.of(legendaryImages);
  List<IconData> bottomBarIcons = [
    Icons.home,
    Icons.analytics_outlined,
    Icons.videocam_rounded,
    Icons.person
  ];

  PageController pageController =
      PageController(viewportFraction: 0.9, initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 12);
    InputBorder textFieldBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          SafeArea(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: padding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Hi, Mustafa!',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 30),
                      ),
                      Stack(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/avatar.jpg'),
                            radius: 20,
                          ),
                          Positioned(
                              right: 3,
                              top: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(255, 122, 36, 226),
                                    borderRadius: BorderRadius.circular(30)),
                                width: 8,
                                height: 8,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: padding,
                  child: searchTextField(textFieldBorder),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: padding,
                  child: const Text(
                    'For You',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white70,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.50,
                    child: forYouPageView(forYouItems)),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: kSearchbarColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                        width: 60,
                        height: 20,
                        child: buildPageIndicators(forYouItems)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: padding,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white70,
                            fontSize: 20),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: kButtonColor,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                /// here enter the popular thing
                SizedBox(height: 225, child: moviesList(popularMovies)),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: padding,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Genres',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white70,
                            fontSize: 20),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: kButtonColor,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(height: 230, child: buildGenresList(myGenreList)),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: padding,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Legendary',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.white70,
                            fontSize: 20),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: kButtonColor,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(height: 225, child: moviesList(legendaryMovies)),
              ],
            ),
          )),

          // for my custom navigation bar
          Positioned(
              bottom: 20, left: 20, right: 20, child: bottomNavigationBar())
        ],
      ),
    );
  }

  Container searchTextField(InputBorder textFieldBorder) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kSearchbarColor,
      ),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white38,
            ),
            hintText: 'Search..',
            hintStyle: const TextStyle(color: Colors.white38),
            fillColor: kSearchbarColor,
            enabledBorder: textFieldBorder,
            focusedBorder: textFieldBorder),
      ),
    );
  }

  ClipRRect bottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Container(
          color: kSearchbarColor,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(
                  bottomBarIcons.length,
                  (index) => Icon(
                        bottomBarIcons[index],
                        size: 30,
                        color: index == 0 ? Colors.white : Colors.white54,
                      ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGenresList(List<MovieModel> genres) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: genres.length,
      itemBuilder: (context, index) {
        return CustomGenresCard(movieModel: genres[index]);
      },
    );
  }

  Widget moviesList(List<MovieModel> movies) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: movies.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return CustomMovieCard(movieModel: movies[index]);
      },
    );
  }

  Widget forYouPageView(List<MovieModel> forYouItems) {
    return PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: forYouItems.length,
        controller: pageController,
        onPageChanged: (newPage) {
          currentPage = newPage;
          setState(() {});
        },
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: const Offset(1, 3),
                  color: Colors.purple.withOpacity(0.2),
                )
              ],
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  forYouItems[index].imageAsset.toString(),
                ),
              ),
            ),
          );
        });
  }

  Widget buildPageIndicators(List<MovieModel> forYouItems) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...forYouItems.map((e) => _pageIndicator(e == forYouItems[currentPage]))
      ],
    );
  }

  Widget _pageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isCurrentPage ? Colors.white : Colors.white38),
    );
  }

  // this is for popular and legendary movies lists
}
