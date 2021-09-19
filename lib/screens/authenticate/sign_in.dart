import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:brew_crew/models/user.dart' as u;

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0,
        title: Text("Brew Crew"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              child: Column(
            children: [
              SizedBox(height: 100),
              TextFormField(
                onChanged: (value) {},
              ),
              SizedBox(height: 50),
              TextFormField(
                onChanged: (value) {},
                obscureText: true,
              ),
              SizedBox(height: 100),
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
                        onPressed: () async {}, child: Text("Sign in")),
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
