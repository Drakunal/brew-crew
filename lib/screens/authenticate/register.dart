import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constant.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'authenticate.dart';

class Register extends StatefulWidget {
  const Register({Key? key, required this.toggleFunctionName})
      : super(key: key);
  final Function toggleFunctionName;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  String _email = '';
  String _password = '';
  String _error = '';
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown.shade100,
            appBar: AppBar(
              backgroundColor: Colors.brown.shade400,
              elevation: 0,
              title: Text("Register to Brew Crew"),
              actions: [
                TextButton.icon(
                    style: ElevatedButton.styleFrom(
                        // primary: Colors.white,

                        ),
                    onPressed: () {
                      widget.toggleFunctionName();
                      print("pressed");
                    },
                    icon: Icon(Icons.login, color: Colors.white),
                    label: Text(" Login",
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
                              value!.isEmpty ? 'Enter an email address' : null,
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
                              ? 'Enter a password greater than 6 characters'
                              : null,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        loading = true;
                                      });
                                      dynamic result =
                                          _auth.registerWithEmailAndPassword(
                                              _email, _password);
                                      // if (result == null) {
                                      setState(() {
                                        _error = 'Please enter a valid email.';
                                      });
                                      // }
                                      print(
                                          "Email is $_email and the password is $_password");
                                    }
                                  },
                                  child: Text(
                                    "Register",
                                  )),
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
