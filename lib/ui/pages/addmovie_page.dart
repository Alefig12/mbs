import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mbs/objects/movie.dart';

class AddMovie extends StatefulWidget {
  const AddMovie({Key? key}) : super(key: key);

  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  String? _selectedItem;
  String? _selectedOption = '';

  TextEditingController movieTitle = TextEditingController();

  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('addMoviePage'),
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            const Text(
              'MOVIES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(width: 40.0),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 43, 4, 56),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.white,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.movie,
                            size: 50.0,
                            color: Colors.black,
                          ),
                          Text(
                            'NEW MOVIE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.movie,
                            size: 50.0,
                            color: Colors.black,
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Movie Title:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: TextFormField(
                              controller: movieTitle,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ADD POSTER IMAGE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: const Text(
                                  'Localization:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.location_on,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              DropdownButton<String>(
                                dropdownColor:
                                    const Color.fromARGB(255, 43, 4, 56),
                                value: _selectedItem,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedItem = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Cinemark Movies 16 and XD',
                                  'Alamo Drafthouse Cinema',
                                  'Premiere Cinema + IMAX',
                                  'Cinemark Tinseltown and XD',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: FittedBox(
                                      fit: BoxFit.fitWidth,
                                      child: Text(value,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'CLASSIFICATION:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  RadioListTile(
                                    title: const Text(
                                      'Legendary',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    value: 'legendary',
                                    groupValue: _selectedOption,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedOption = newValue as String;
                                      });
                                    },
                                    activeColor: Colors.white,
                                  ),
                                  RadioListTile(
                                    title: const Text('Fantasy',
                                        style: TextStyle(color: Colors.white)),
                                    value: 'fantasy',
                                    groupValue: _selectedOption,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedOption = newValue as String;
                                      });
                                    },
                                    activeColor: Colors.white,
                                  ),
                                  RadioListTile(
                                    title: const Text(
                                      'Adventure',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    value: 'adventure',
                                    groupValue: _selectedOption,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedOption = newValue as String;
                                      });
                                    },
                                    activeColor: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: 320.0,
                        height: 60,
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.grey),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 244, 192, 30)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            String title = movieTitle.text;
                            String location = _selectedItem!;
                            String genre = _selectedOption!;
                            MovieController movieController = Get.find();

                            Movie movie =
                                Movie(0, title, [], "", Duration(hours: 2));

                            movie.addGenre(genre);

                            movieController.addMovie(movie);

                            Get.back();
                          },
                          child: const Text(
                            'ADD MOVIE',
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
