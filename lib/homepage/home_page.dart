import 'package:flutter/material.dart';

import 'package:travice/homepage_items/offers_dash.dart';
import 'package:travice/homepage_items/service_container.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(

    children: [
      SizedBox(height:10),
      Container(
        child: DashBoard(),
      ),
      SizedBox(height:20),
      Container(

        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color:Colors.grey.shade200,
              blurRadius: 20,
              spreadRadius: 10,
              offset: Offset(10, 10)
            )
          ]
        ),
        child: ServiceHomePage(),
      ),
      // Container(
      //   padding: EdgeInsets.symmetric(vertical:20,horizontal:10),
      //   margin: EdgeInsets.all(10),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.circular(20),
      //     boxShadow: [
      //       BoxShadow(
      //         color:Colors.grey.shade200,
      //         blurRadius: 20,
      //         spreadRadius: 10,
      //         offset: Offset(10, 10)
      //       )
      //     ]
      //   ),
      //   child: ServiceHomePage()),
      Row(
        children: [
          Expanded(child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color:Colors.grey.shade200,
              blurRadius: 20,
              spreadRadius: 10,
              offset: Offset(10, 10)
            )
          ]
        ),
            child: Column(
              children:[
                Image.asset("asset/new.png",height: 100,),
                Text("Buy New Tractor")
              ]
            ),
          )),
          Expanded(child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color:Colors.grey.shade200,
              blurRadius: 20,
              spreadRadius: 10,
              offset: Offset(10, 10)
            )
          ]
        ),
            child: Column(
              children:[
                Image.asset("asset/sell.jpg",height: 100,),
                Text("Sell Your Tractor"),
              ]
            ),
          ))
        ],
      ),
      SizedBox(height:70)
    ],
    
        );
  }
}