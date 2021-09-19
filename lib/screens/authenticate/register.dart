import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  // final AuthService _auth = AuthService();

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0,
        title: Text("Register to Brew Crew"),
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
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          print(
                              "Email is $_email and the password is $_password");
                        },
                        child: Text("Register")),
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
