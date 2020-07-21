import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      //alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SpinKitFadingCircle(
            
            color: Colors.red,
            size: 100,
          ),
          SizedBox(height: 20,),
          Text("Loading",style: TextStyle(
            color: Colors.red,
            fontSize: 25,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            ),),
        ],
      ),
    );
  }
}