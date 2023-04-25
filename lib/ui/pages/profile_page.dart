import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbs/custom_icons_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Title(color: Colors.white, child: Text("MY PROFILE",
            style: GoogleFonts.montserrat(textStyle: const TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold
            )),)
            ),
          ),
          const Divider(
            color: Color(0XFFb2a4c7),
            thickness: 3,
          ),
          profilePicAndName,
          const Divider(
            color: Color(0XFFb2a4c7),
            thickness: 3,
          ),
          manageAccount,
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

Widget profilePicAndName = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Icon(Icons.person,size: 100,color: Colors.white),
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text("Hello,\n" + "Tom!",style: GoogleFonts.poppins(
            textStyle: const TextStyle(
               fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 35
            ),
          ),),
        ),
        Text('tbrown@ttu.edu',style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          )
        )),
      ],
    )
  ],
);

Widget manageAccount = Expanded(
    child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Manage account',
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 25),
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        color: const Color(0XFF694f93),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  Text(
                    'Personal information',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0XFFb2a4c7),
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: Icon(Icons.video_camera_back, color: Colors.white),
                  ),
                  Text(
                    'My Cinema',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0XFFb2a4c7),
              thickness: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 4.0),
                    child: Icon(Icons.payment, color: Colors.white),
                  ),
                  Text(
                    'Saved Payment Accounts',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20
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
    Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.exit_to_app_rounded,color: Colors.white,size: 50),
          Text('Sign out',style: TextStyle(color: Colors.white,fontSize: 30))
        ],
      ),
    ),
  ],
));
