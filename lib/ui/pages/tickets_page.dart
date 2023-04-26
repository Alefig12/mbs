import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketPage extends StatelessWidget {
  List<AMovie> movies;

  TicketPage({Key? key,required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF281c4b),
      appBar: AppBar(
        backgroundColor: const Color(0XFF281c4b),
        title: Title(
            color: Colors.white,
            child: Text(
              "MY TICKETS",
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {},
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: Color(0XFFb2a4c7),
            thickness: 3,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'UPCOMING',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 500,
            width: 500,
            child: ListView(
              children: [
                for(AMovie curMovie in movies)
                  curMovie
              ],
            ),
          )

        ],
      ),
    );
  }
}



class AMovie extends StatelessWidget{
  String movieName;
  String movieLocation;
  Image movieImage;
  AMovie({super.key,
    required this.movieName,
    required this.movieLocation,
    required this.movieImage
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
      child: Column(
        children: [
          Text(
            movieName,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: movieImage
          ),
          Text(
            movieLocation,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

}