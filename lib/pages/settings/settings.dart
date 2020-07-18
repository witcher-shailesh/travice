import 'package:flutter/material.dart';
import 'package:travice/authentication/auth.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        

        RaisedButton(
          onPressed: ()async{
            await _auth.signout();
          },
          child: Text("Sign Out"),

          )
      ],
    );
  }
}