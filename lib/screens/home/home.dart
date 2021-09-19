import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  // const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0,
        title: Text("Brew Crew"),
        actions: [
          TextButton(
              onPressed: () async {
                await _auth.signOut();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  Text(
                    " Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            // child: ElevatedButton(
            //     onPressed: () async {
            //       dynamic result = await _auth.signInAnon();
            //       if (result == null) {
            //         print("error signing in...");
            //       } else {
            //         print("Signed in...");
            //         print(result.uId);
            //       }
            //     },
            //     child: Text("Sign in anonymously")),
            ),
      ),
    );
  }
}
