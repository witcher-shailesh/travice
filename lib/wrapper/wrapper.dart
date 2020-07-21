import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travice/pages/homepage/build_travice.dart';
import 'package:travice/pages/user_authonticate/authenticate.dart';
import 'package:travice/serverSide/models/user_model.dart';


import '../main.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    
    if(user==null){
      return Authenticate();
    }else{
    return TraviceInherited(
        child: BuildTravice(),
     );
    }
  }
}