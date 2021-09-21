import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constant.dart';

class UserSettings extends StatefulWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  _UserSettingsState createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  String _name = '';
  String _sugar = '0';
  int strength = 0;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text("Update"),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(
              hintText: 'Name',
            ),
            validator: (value) => value!.isEmpty ? 'Enter a name' : null,
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(
              hintText: 'Sugars',
            ),
            validator: (value) => value!.isEmpty ? 'Enter Sugar value' : null,
            onChanged: (value) {
              setState(() {
                _sugar = value;
              });
            },
          ),
          ElevatedButton(
              onPressed: () {
                print(_name);
              },
              child: Text("Update"))
        ],
      ),
    );
  }
}
