import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mbs/objects/customer.dart';
import 'package:mbs/ui/widget/movieProfile.dart';

class TicketPage extends StatelessWidget {
  TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomerController customerController = Get.find<CustomerController>();
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
                textStyle: const TextStyle(
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
            child: ListView.builder(
                itemCount: customerController.customer.tickets.length,
                itemBuilder: (context, index) {
                  // Date formated as MM-dd-yyyy
                  String date = DateFormat.yMMMd()
                      .format(
                          customerController.customer.tickets[index].showTime)
                      .toString();

                  // Duration formated as hh:mm
                  Duration duration =
                      customerController.customer.tickets[index].movie.duration;

                  String dur =
                      "${duration.inHours}h ${duration.inMinutes % 60}m";
                  return AMovie(
                    movieName:
                        customerController.customer.tickets[index].movie.name,
                    movieLocation:
                        customerController.customer.tickets[index].cinemaName,
                    movieDate: date,
                    movieTicketQty: customerController
                        .customer.tickets[index].numberOfSeats
                        .toString(),
                    movieGenre: customerController
                        .customer.tickets[index].movie.genres
                        .toString(),
                    movieDuration: dur,
                    movieImage: Image.asset(
                      'assets/poster1.jpg',
                      fit: BoxFit.cover,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class AMovie extends StatelessWidget {
  String movieName;
  String movieLocation;
  Image movieImage;
  String movieDate;
  String movieTicketQty;
  String movieGenre;
  String movieDuration;

  AMovie(
      {super.key,
      required this.movieName,
      required this.movieLocation,
      required this.movieDate,
      required this.movieTicketQty,
      required this.movieGenre,
      required this.movieDuration,
      required this.movieImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 66, 46, 126),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(77, 0, 0, 0).withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  child: movieImage,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieName,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Genre: $movieGenre',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 236, 97, 27),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      movieLocation,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      'Date: $movieDate',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      'Duration: $movieDuration',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      'Tickets: $movieTicketQty',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
