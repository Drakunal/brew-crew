import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:brew_crew/models/user.dart' as u;

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.toggleFunctionName}) : super(key: key);
  final Function toggleFunctionName;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0,
        title: Text("Brew Crew"),
        actions: [
          TextButton.icon(
              style: ElevatedButton.styleFrom(
                  // primary: Colors.white,

                  ),
              onPressed: () {
                widget.toggleFunctionName();
              },
              icon: Icon(Icons.login, color: Colors.white),
              label: Text(" Register",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              child: Column(
            children: [
              SizedBox(height: 50),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(height: 25),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                obscureText: true,
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          dynamic result = await _auth.signInAnon();
                          if (result == null) {
                            print("error signing in...");
                          } else {
                            print("Signed in...");
                            print(result.uId);
                          }
                        },
                        child: Text("Sign in anonymously")),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          print(
                              "Email is $_email and the password is $_password");
                        },
                        child: Text("Sign in")),
                  )
                ],
              ),
            ],
          ))
          // child: Container(
          //   child: ElevatedButton(
          //       onPressed: () async {
          //         dynamic result = await _auth.signInAnon();
          //         if (result == null) {
          //           print("error signing in...");
          //         } else {
          //           print("Signed in...");
          //           print(result.uId);
          //         }
          //       },
          //       child: Text("Sign in anonymously")),
          // ),
          ),
    );
  }
}
