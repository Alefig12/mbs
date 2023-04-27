import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Movie theater',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
          ),
          SizedBox(
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
                            Get.to(AddMovie());
                          },
                          icon: Icon(
                            Icons.add_circle_outline,
                            size: 35,
                            color: Colors.white,
                          ),
                        )),
                  Expanded(
                    flex: 11,
                    child: Container(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          fillColor: Color.fromARGB(82, 255, 255, 255),
                          hintText: 'browse...',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
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
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 9,
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.to(selectedMoviePage(
                          movieImage: AssetImage('assets/poster1.jpg'),
                          movieGenders: ['thriller', 'fantasy'],
                          movieName: 'Parallel',
                        ));
                      },
                      child: Container(
                        child: posterMovie(
                          movieImage: AssetImage('assets/poster1.jpg'),
                          movieGenders: ['thriller', 'fantasy'],
                          movieName: 'Parallel',
                          admin: admin,
                        ),
                      )),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
          ),
          Expanded(
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
              padding: EdgeInsets.all(18),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) => Row(
                children: [
                  Container(width: 300, child: popularMovie()),
                  SizedBox(
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
