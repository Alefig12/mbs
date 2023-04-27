import 'package:flutter/material.dart';
import 'package:mbs/ui/pages/login_page.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Key('signUpPage'),
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
                    'SIGN UP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  )
                ]),
              ),
              SizedBox(height: 5.0),
              Wrap(
                children: [
                  Text(
                    'Already have an account?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(' Login here',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 223, 92, 246))),
                  )
                ],
              ),
              SizedBox(height: 40.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NAME',
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
                  SizedBox(height: 20.0),
                  Text(
                    'CONFIRM PASSWORD',
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ))));
  }
}