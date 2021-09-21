import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
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
    void _showSettings() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(20),
              child: UserSettings(),
            );
          });
    }

    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService(uid: 'uid').brews,
      child: Scaffold(
        backgroundColor: Colors.brown.shade100,
        appBar: AppBar(
          backgroundColor: Colors.brown.shade400,
          elevation: 0,
          title: Text("Tea Family"),
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
              onPressed: () {
                _showSettings();
              },
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
        body: Container(
          // padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/teaa.png'), fit: BoxFit.cover)),
          child: BrewList(),
        ),
      ),
    );
  }
}
