import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddMovie extends StatefulWidget {
  const AddMovie({Key? key}) : super(key: key);

  @override
  _AddMovieState createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  String? _selectedItem;
  String? _selectedOption = '';

  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('addMoviePage'),
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            Text(
              'MOVIES',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(width: 40.0),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 43, 4, 56),
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
                        children: [
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
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Movie Title:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Expanded(
                            child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
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
                      SizedBox(height: 30.0),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ADD POSTER IMAGE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Localization:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.location_on,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5.0),
                              DropdownButton<String>(
                                dropdownColor: Color.fromARGB(255, 43, 4, 56),
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
                                    child: Text(value,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        )),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          SizedBox(height: 25.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CLASSIFICATION:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  RadioListTile(
                                    title: Text(
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
                                    title: Text('Fantasy',
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
                                    title: Text(
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
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: 320.0,
                        height: 60,
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.grey),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 244, 192, 30)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
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
