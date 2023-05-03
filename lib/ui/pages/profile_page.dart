import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbs/custom_icons_icons.dart';
import 'package:mbs/objects/auth_controller.dart';
import 'package:mbs/objects/customer.dart';

class ProfilePage extends StatefulWidget {
  String name;
  String email;

  ProfilePage({super.key, required this.name, required this.email});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF281c4b),
      appBar: AppBar(
        backgroundColor: const Color(0XFF281c4b),
        title: Title(
            color: Colors.white,
            child: Text(
              "MY PROFILE",
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Divider(
            color: Color(0XFFb2a4c7),
            thickness: 3,
          ),
          ProfilePicAndName(name: widget.name, email: widget.email),
          const Divider(
            color: Color(0XFFb2a4c7),
            thickness: 3,
          ),
          ManageAccount(name: widget.name, email: widget.email),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Color(0XFF3b2c69)),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.ticket),
              label: "Tickets",
              backgroundColor: Color(0XFF3b2c69)),
          BottomNavigationBarItem(
              icon: Icon(CustomIcons.cinema),
              label: "Movies",
              backgroundColor: Color(0XFF3b2c69)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Color(0XFF3b2c69)),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ProfilePicAndName extends StatelessWidget {
  String name;
  String email;

  ProfilePicAndName({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.person, size: 100, color: Colors.white),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Hello,\n$name",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 35),
                ),
              ),
            ),
            Text(email,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ))),
          ],
        )
      ],
    );
  }
}

class ManageAccount extends StatelessWidget {
  String name;
  String email;

  ManageAccount({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Manage account',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 25),
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          name == 'admin' ? adminCard : personCard,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.exit_to_app_rounded,
                      color: Colors.white, size: 50),
                  onPressed: () {
                    AuthenticationController authController =
                        Get.find<AuthenticationController>();

                    authController.logout();
                  }),
              TextButton(
                child: Text('Sign out',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
                onPressed: () {
                  AuthenticationController authController =
                      Get.find<AuthenticationController>();

                  authController.logout();
                },
              )
            ],
          ),
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

Widget adminCard = Card(
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10))),
  color: const Color(0XFF694f93),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: Icon(Icons.person, color: Colors.white),
          ),
          Text(
            'Personal information',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
      const Divider(
        color: Color(0XFFb2a4c7),
        thickness: 3,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: Icon(Icons.print, color: Colors.white),
          ),
          Text(
            'Print Report',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            ),
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

Widget personCard = Card(
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10))),
  color: const Color(0XFF694f93),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: Icon(Icons.person, color: Colors.white),
          ),
          Text(
            'Personal information',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
      const Divider(
        color: Color(0XFFb2a4c7),
        thickness: 3,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: Icon(Icons.video_camera_back, color: Colors.white),
          ),
          Text(
            'My cinema',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
      const Divider(
        color: Color(0XFFb2a4c7),
        thickness: 3,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: Icon(Icons.payment, color: Colors.white),
          ),
          Text(
            'Saved payment accounts',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            ),
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
