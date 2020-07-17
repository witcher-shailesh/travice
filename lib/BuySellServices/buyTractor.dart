import 'package:flutter/material.dart';

class BuyTractor extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(  
        appBar: AppBar(
          centerTitle: true,
          bottom: TabBar(tabs: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("New ",style: TextStyle(fontSize:20),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Old",style: TextStyle(fontSize:20),),
            )
          ]),
          title: Text("Buy Tractor"),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.red,
        ),
        body:TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Image(image: AssetImage("asset/new.png"),height: 300,),
            Text("New Tractor List"),
          ],),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image(image: AssetImage("asset/sell.jpg"),height: 300,),
            Text("Old Tractor List"),
          ],)
        ])
      ),
    );
  }
}