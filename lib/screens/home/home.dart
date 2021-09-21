import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/screens/home/brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  // const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService(uid: 'uid').brews,
      child: Scaffold(
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
                )),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  Text("Setting", style: TextStyle(color: Colors.white)),
                ],
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BrewList(),
        ),
      ),
    );
  }
}
