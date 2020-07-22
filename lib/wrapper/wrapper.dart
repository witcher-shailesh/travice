import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travice/pages/homepage/build_travice.dart';
import 'package:travice/pages/user_authonticate/authenticate.dart';
import 'package:travice/pages/user_authonticate/getDeatails.dart';
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
    final userStreamSnapshot = Provider.of<QuerySnapshot>(context);
    bool check =false;
    if(user!=null){
      if(userStreamSnapshot.documents.where((element) => element.documentID==user.uid).length!=0){
      check = true;
    }
    }
    if(user==null){
      return Authenticate();
    }else{
    return check ?TraviceInherited(
        child: BuildTravice(),
     ):GetDetails();
     

    }
  }
}