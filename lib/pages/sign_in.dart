
// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flower_app/pages/forgot_password.dart';
import 'package:flutter_flower_app/pages/register.dart';
import 'package:flutter_flower_app/provider/google_signin.dart';
import 'package:flutter_flower_app/shared/colors.dart';
import 'package:flutter_flower_app/shared/constants.dart';
import 'package:flutter_flower_app/shared/snackbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisable = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  signIn() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "Error : ${e.code}");
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final googleSignInProvier = Provider.of<GoogleSignInProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbarGreen,
          title: const Text("Sign in"),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 150,
              ),
              TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: decorationTextField.copyWith(
                      hintText: "Enter Your Email : ",
                      suffixIcon: const Icon(Icons.email))),
              const SizedBox(
                height: 30,
              ),
              TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: isVisable ? true : false,
                  decoration: decorationTextField.copyWith(
                      hintText: "Enter Your Password : ",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisable = !isVisable;
                            });
                          },
                          icon: isVisable
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off)))),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  await signIn();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(BTNgreen),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: const Text(
                  "Sign in",
                  style: TextStyle(fontSize: 19),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPassword()),
                    );
                  },
                  child: const Text(
                    "Forgot Password ? ",
                    style: TextStyle(
                        fontSize: 20, decoration: TextDecoration.underline),
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Do not have an account?",
                      style: TextStyle(fontSize: 20)),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Register()),
                      );
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text('Sign Up',
                            style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline)),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              const SizedBox(
                width: 299,
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.6,
                    )),
                    Text(
                      "OR",
                      style: TextStyle(),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.6,
                    )),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        googleSignInProvier.googlelogin();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                // color: Colors.purple,
                                width: 1)),
                        child: SvgPicture.asset(
                          "assets/img/icons8-google.svg",
                          // color: Colors.purple[400],
                          height: 27,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        )));
  }
}
