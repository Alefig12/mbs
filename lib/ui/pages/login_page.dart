import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mbs/ui/pages/signup_page.dart';

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
                child: Column(children: [
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  )
                ])),
            SizedBox(height: 80.0),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: 320.0,
                child: TextFormField(
                    decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                )),
              ),
              SizedBox(height: 20.0),
              Text(
                'PASSWORD',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: 320.0,
                child: TextFormField(
                    decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                )),
              ),
              SizedBox(height: 40.0),
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
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 223, 92, 246)),
                    ),
                  ),
                ],
              )
            ])
          ],
        )))));
  }
}
