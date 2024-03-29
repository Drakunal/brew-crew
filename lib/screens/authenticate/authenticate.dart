import 'package:brew_crew/screens/authenticate/register.dart';
import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isRegister = true;
  void toggle() {
    print("Reached");
    setState(() {
      isRegister = !isRegister;
      print("Changing");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isRegister) {
      return Container(
        child: Register(toggleFunctionName: toggle),
      );
    } else {
      return Container(
        child: SignIn(toggleFunctionName: toggle),
      );
    }
  }
}
