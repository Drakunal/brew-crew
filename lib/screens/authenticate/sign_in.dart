import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constant.dart';
import 'package:brew_crew/shared/loading.dart';
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
  final _formKey = GlobalKey<FormState>();
  String _error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown.shade100,
            appBar: AppBar(
              backgroundColor: Colors.brown.shade400,
              elevation: 0,
              title: Text("Login to Tea Family"),
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
                padding: const EdgeInsets.all(50.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                            hintText: 'Email',
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Enter an email' : null,
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                            hintText: 'Password',
                          ),
                          validator: (value) => value!.length < 6
                              ? 'Enter a password of atleast 6 characters'
                              : null,
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 25),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      print("valid");
                                      dynamic result =
                                          _auth.loginWithEmailAndPassword(
                                              _email, _password);
                                      // if (result == null) {
                                      setState(() {
                                        // loading = false;
                                        _error = 'Wrong Credentials';
                                      });
                                      // }
                                      // print(
                                      //     "Email is $_email and the password is $_password");
                                    }
                                  },
                                  child: Text("Sign in")),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      loading = true;
                                    });
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
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(_error,
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
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
