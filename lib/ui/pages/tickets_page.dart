import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF281c4b),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Title(color: Colors.white, child: Text("MY TICKETS",
              style: GoogleFonts.montserrat(textStyle: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              )),)
            ),
          ),
        ],
      ),
    );
  }
}
