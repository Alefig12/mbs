import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: const Key('mainPage'),
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
              icon: const Icon(Icons.person_outline_rounded),
              onPressed: () {},
            ),
            const Text(
              'Hello, Guest!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
              ),
            )
          ]),
          backgroundColor: const Color.fromARGB(255, 43, 4, 56),
          centerTitle: true,
          elevation: 1,
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
                  children: const [
                    Text(
                      'MOVIE \n THEATER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                )),
            const SizedBox(height: 250.0),
            SizedBox(
              width: 320.0,
              height: 60,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: 320.0,
              height: 60,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Log In',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        )))));
  }
}
