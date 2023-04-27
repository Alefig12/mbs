import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mbs/ui/pages/menu_page.dart';
import 'package:mbs/ui/pages/profile_page.dart';
import 'package:mbs/ui/pages/tickets_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _navIndex = 0;
  PageController _pageController = PageController();

  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    // ignore: prefer_const_constructors
    MenuPage(),
    TicketPage(movies: [
      (AMovie(
        movieImage: Image.asset('assets/poster2.jpg'),
        movieLocation: 'lubbock',
        movieName: 'el salvador',
      )),
      (AMovie(
        movieImage: Image.asset('assets/poster2.jpg'),
        movieLocation: 'lubbock',
        movieName: 'el salvador',
      )),
      (AMovie(
        movieImage: Image.asset('assets/poster2.jpg'),
        movieLocation: 'lubbock',
        movieName: 'el salvador',
      ))
    ]),
    ProfilePage(name: 'User/Admin', email: 'email@inst.com')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _navIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(microseconds: 600), curve: Curves.easeOut);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: Center(
            child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _navIndex = index;
            });
          },
          children: _widgetOptions,
        )),
      ),
      // ignore: prefer_const_constructors
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 28, 1, 35),
          boxShadow: [
            BoxShadow(color: Colors.black, spreadRadius: 0, blurRadius: 18),
          ],
        ),

        // ignore: prefer_const_constructors
        child: Padding(
          padding: const EdgeInsets.all(10),

          // ignore: prefer_const_constructors
          child: GNav(
              backgroundColor: Color.fromARGB(255, 28, 1, 35),
              color: Colors.white,
              activeColor: Color.fromARGB(255, 255, 145, 61),
              tabBackgroundColor: Color.fromARGB(255, 28, 1, 35),
              padding: const EdgeInsets.all(10),
              gap: 8,
              selectedIndex: _navIndex,
              onTabChange: (index) {
                _onItemTapped(index);
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  iconSize: 30,
                  text: 'home',
                ),
                GButton(
                  icon: Icons.local_activity,
                  text: 'tickets',
                  iconSize: 30,
                ),
                GButton(
                  icon: Icons.supervisor_account,
                  text: 'profile',
                  iconSize: 30,
                ),
              ]),
        ),
      ),
    );
  }
}
