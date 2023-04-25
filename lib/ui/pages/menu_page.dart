import 'package:flutter/material.dart';
import '../widget/movieProfile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Movie theater',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 45),
            ),
            Row(
              children: [
                Icon(
                  Icons.find_in_page,
                  size: 50,
                ),
                Container(
                  width: 300,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(),
                      fillColor: Color.fromARGB(82, 255, 255, 255),
                      hintText: 'browse...',
                    ),
                  ),
                ),
              ],
            ),
            Movie(),
          ],
        ),
      ),
    ));
  }
}
