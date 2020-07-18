import 'package:flutter/material.dart';
import 'package:travice/user_authonticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      home: SignIn());
  }
}