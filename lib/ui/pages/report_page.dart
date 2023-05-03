import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/objects/admin.dart';
import 'package:mbs/objects/movie.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  Future<int> getTotalNumberOfTickets() async {
    AdminController adminController = Get.find();
    return await adminController.getTotalNumberOfTickets();
  }

  @override
  Widget build(BuildContext context) {
    MovieController movieController = Get.find();
    AdminController adminController = Get.find();
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              'Report',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Text(
                'Total tickets sold',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 60),
                textAlign: TextAlign.center,
              )),
          Padding(
            padding: EdgeInsets.all(20),
            child: FutureBuilder(
                future: getTotalNumberOfTickets(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text(
                      "Loading...",
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.w700,
                          fontSize: 60),
                    );
                  }
                  return Text(
                    "${snapshot.data}",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.w700,
                        fontSize: 60),
                  );
                }),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 66, 46, 126),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(77, 0, 0, 0).withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          "Movies Playing",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 30),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: ListView.builder(
                            itemCount: movieController.movies.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 12.0, 12.0, 12),
                                child: Text(
                                  "${index + 1}. ${movieController.movies[index].name}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 19),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
