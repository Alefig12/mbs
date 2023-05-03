import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbs/objects/auth_controller.dart';
import 'package:mbs/ui/pages/login_page.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          shadowColor: const Color.fromARGB(255, 43, 4, 56),
          backgroundColor: const Color.fromARGB(255, 43, 4, 56),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        key: const Key('signUpPage'),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(children: const [
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
              const SizedBox(height: 5.0),
              Wrap(
                children: [
                  const Text(
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
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(' Login here',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.w900,
                            color: Color.fromARGB(255, 223, 92, 246))),
                  )
                ],
              ),
              const SizedBox(height: 40.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'NAME',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: 320.0,
                    child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'EMAIL',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: 320.0,
                    child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'PASSWORD',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: 320.0,
                    child: TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'CONFIRM PASSWORD',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: 320.0,
                    child: TextFormField(
                        controller: confirmPasswordController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 40.0),
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
                      onPressed: () {
                        AuthenticationController authenticationController =
                            Get.find();

                        //Check if the email is valid
                        if (authenticationController
                                .isEmailValid(emailController.text) ==
                            false) {
                          Get.snackbar(
                            'Invalid Email',
                            'Please enter a valid email',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          return;
                        }

                        if (authenticationController
                                .isPasswordValid(passwordController.text) ==
                            false) {
                          Get.snackbar(
                            'Invalid Password',
                            'Please enter a 6 character or more password',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          return;
                        }

                        if (authenticationController.passwordsMatch(
                                passwordController.text,
                                confirmPasswordController.text) ==
                            false) {
                          Get.snackbar(
                            'Password Mismatch',
                            'Please enter the same password',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          return;
                        }

                        authenticationController
                            .signup(
                                emailController.text, passwordController.text)
                            .then((value) => {
                                  if (value == "success")
                                    {
                                      Get.snackbar("Success", "Account created",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.green,
                                          colorText: Colors.white)
                                    }
                                  else if (value == "email-already-in-use")
                                    {
                                      Get.snackbar("Error",
                                          "The account already exists for that email.",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white)
                                    }
                                  else
                                    {
                                      Get.snackbar(
                                          "Error", "Account not created",
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.red,
                                          colorText: Colors.white)
                                    }
                                });
                      },
                      child: const Text(
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
