import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constant.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  String _currentName = '';
  String _currentSugar = '0';
  int _currentStrength = 100;
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    var uid;
    if (user == null) {
      uid = "Null Uid is being sent";
    } else {
      uid = user.uid;
    }

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  Text("If Update"),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: userData!.name,
                    // userData!.name
                    decoration: textInputDecoration.copyWith(
                      hintText: 'Name',
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter a name' : null,
                    onChanged: (value) {
                      setState(() {
                        _currentName = value;
                      });
                    },
                  ),
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _currentSugar,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text("$sugar Sugars"),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _currentSugar = value.toString();
                      });
                    },
                  ),
                  Slider(
                      activeColor: Colors.brown[_currentStrength],
                      inactiveColor: Colors.grey,
                      min: 100,
                      max: 900,
                      divisions: 8,
                      value: (_currentStrength ?? 100).toDouble(),
                      onChanged: (value) {
                        setState(() {
                          _currentStrength = value.round();
                        });
                      }),
                  ElevatedButton(
                      onPressed: () {
                        print(_currentName);
                        print(_currentSugar);
                        print(_currentStrength);
                      },
                      child: Text("If Update"))
                ],
              ),
            );
          } else {
            return Container();
            // return Form(
            //   key: _formKey,
            //   child: Column(
            //     children: [
            //       const Text("Else Update"),
            //       SizedBox(
            //         height: 10,
            //       ),
            //       TextFormField(
            //         initialValue: "Else part",
            //         decoration: textInputDecoration.copyWith(
            //           hintText: 'Name',
            //         ),
            //         validator: (value) =>
            //             value!.isEmpty ? 'Enter a name' : null,
            //         onChanged: (value) {
            //           setState(() {
            //             _currentName = value;
            //           });
            //         },
            //       ),
            //       DropdownButtonFormField(
            //         decoration: textInputDecoration,
            //         value: _currentSugar,
            //         items: sugars.map((sugar) {
            //           return DropdownMenuItem(
            //             value: sugar,
            //             child: Text("$sugar Sugars"),
            //           );
            //         }).toList(),
            //         onChanged: (value) {
            //           setState(() {
            //             _currentSugar = value.toString();
            //           });
            //         },
            //       ),
            //       Slider(
            //           activeColor: Colors.brown[_currentStrength],
            //           inactiveColor: Colors.grey,
            //           min: 100,
            //           max: 900,
            //           divisions: 8,
            //           value: (_currentStrength ?? 100).toDouble(),
            //           onChanged: (value) {
            //             setState(() {
            //               _currentStrength = value.round();
            //             });
            //           }),
            //       ElevatedButton(
            //           onPressed: () {
            //             print(_currentName);
            //             print(_currentSugar);
            //             print(_currentStrength);
            //           },
            //           child: Text("Else Update"))
            //     ],
            //   ),
            // );
          }
        });
  }
}
