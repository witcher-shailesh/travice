import 'package:flutter/material.dart';
import 'package:travice/pages/homepage/homepage_items/offers_dash.dart';

import 'homepage_items/buy_sell.dart';
import 'homepage_items/service_container.dart';


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

      Container(//DashBoard-(OFFERS)

        child: DashBoard(),
      ),

      SizedBox(height:20),

      Container(//ServiceContainer

        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal:10,vertical: 25),
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
      
      BuySellTractor(),

      SizedBox(height:70)
      
    ],
    
        );
  }
}



