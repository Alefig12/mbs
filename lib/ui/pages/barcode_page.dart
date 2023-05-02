import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BarcodePage extends StatelessWidget {
  Image movieImage;
  String movieName;
  String movieLocation;
  String auditoriumNum;
  String movieTime;
  Image barcode;

  BarcodePage({
    Key? key,
    required this.movieImage,
    required this.movieName,
    required this.movieLocation,
    required this.auditoriumNum,
    required this.movieTime,
    required this.barcode,
  }) : super(key: key);

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
        children: [
          Text(
            movieName,
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          ClipRRect(borderRadius: BorderRadius.circular(20), child: movieImage),
          Text(
            movieLocation,
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          Text(
            "AUDITORIUM $auditoriumNum",
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(fontSize: 18, color: Colors.white)),
          ),
          Text(
            "TIME: $movieTime",
            style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            width: 500,
            height: 150,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: barcode,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.print, color: Colors.white),
              Text(
                'PRINT TICKETS',
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          )
        ]
            .map((widget) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: widget,
                ))
            .toList(),
      ),
    );
  }
}
