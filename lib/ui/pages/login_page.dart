import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('loginPage'),
        appBar: AppBar(
          title: Text(
            'Hello, Guest!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 43, 4, 56),
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
                  children: [
                    Text(
                      'Movie \n Theater',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                )),
            SizedBox(height: 250.0),
            SizedBox(
              width: 300.0,
              height: 45,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            SizedBox(
              width: 300.0,
              height: 45,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        )))));
  }
}
