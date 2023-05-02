import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/objects/admin.dart';
import 'package:mbs/objects/movie.dart';
import 'package:mbs/ui/pages/addmovie_page.dart';
import 'package:mbs/ui/pages/buyTickets_page.dart';
import 'package:mbs/ui/pages/selectedMovie_page.dart';
import '../widget/movieProfile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final ScrollController scrollController = ScrollController();
  bool admin = true;
  String search = '';
  MovieController movieController = Get.find();
  TextEditingController searchController = TextEditingController();
  List<Movie> movieList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieList = movieController.movies;
    AdminController adminController = Get.find();
    admin = adminController.isAdmin();
  }

  @override
  Widget build(BuildContext context) {
    movieList = movieController.movies;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            flex: 1,
            child: Text(
              'Movie theater',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Row(
                children: [
                  if (admin)
                    Expanded(
                        flex: 2,
                        child: IconButton(
                          onPressed: () {
                            Get.to(() => const AddMovie())!.then((value) {
                              setState(() {});
                            });
                          },
                          icon: const Icon(
                            Icons.add_circle_outline,
                            size: 35,
                            color: Colors.white,
                          ),
                        )),
                  Expanded(
                    flex: 11,
                    child: Container(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fillColor: const Color.fromARGB(80, 255, 255, 255),
                          hintText: 'type here...',
                        ),
                        onChanged: (value) {
                          setState(() {
                            search = value;
                            // movieList = movieController.searchMovie(search);
                            // print(movieList);
                          });
                        },
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 9,
            child: Obx(
              () => ListView.builder(
                  controller: scrollController,
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
                  scrollDirection: Axis.horizontal,
                  itemCount: movieController.movies
                      .where((movie) => movie.name
                          .toLowerCase()
                          .contains(search.toLowerCase()))
                      .toList()
                      .length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                movieController.selectedMovie = movieController
                                    .movies
                                    .where((movie) => movie.name
                                        .toLowerCase()
                                        .contains(search.toLowerCase()))
                                    .toList()[index];
                                Get.to(selectedMoviePage(
                                  movieImage:
                                      const AssetImage('assets/poster1.jpg'),
                                  movie: movieController.movies
                                      .where((movie) => movie.name
                                          .toLowerCase()
                                          .contains(search.toLowerCase()))
                                      .toList()[index],
                                ));
                              },
                              child: Container(
                                child: posterMovie(
                                  movie: movieController.movies
                                      .where((movie) => movie.name
                                          .toLowerCase()
                                          .contains(search.toLowerCase()))
                                      .toList()[index],
                                  movieImage:
                                      const AssetImage('assets/poster1.jpg'),
                                  movieGenders: movieController.movies
                                      .where((movie) => movie.name
                                          .toLowerCase()
                                          .contains(search.toLowerCase()))
                                      .toList()[index]
                                      .genres,
                                  movieName: movieController.movies
                                      .where((movie) => movie.name
                                          .toLowerCase()
                                          .contains(search.toLowerCase()))
                                      .toList()[index]
                                      .name,
                                  admin: admin,
                                ),
                              )),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Most Popular',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.all(18),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Row(
                children: [
                  Container(width: 300, child: const popularMovie()),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
