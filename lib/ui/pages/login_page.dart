import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('loginPage'),
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
                    SizedBox(
                        height:
                            100), // Add some space between the text and the image
                    Image.asset('assets/Imagen_Portada.png'),
                  ],
                )),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              ),
              onPressed: () {},
              child: Text('Sign Up'),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {},
              child: Text('Log In'),
            ),
          ],
        )))));
  }
}
