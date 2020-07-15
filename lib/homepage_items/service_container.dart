import 'package:flutter/material.dart';

class ServiceHomePage extends StatefulWidget {
  @override
  _ServiceHomePageState createState() => _ServiceHomePageState();
}

class _ServiceHomePageState extends State<ServiceHomePage> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      children:[
        Container(
          width: 52,
          margin: EdgeInsets.all(10),
          child:Column(
            children: [
              Image.asset("asset/img0.png",height: 50,width: 50,),
              Text("Quick Service",textAlign: TextAlign.center,),
          ],)
        ),
        Container(
          width: 52,
          margin: EdgeInsets.all(10),
          child:Column(
            children: [
              Image.asset("asset/img3.png",height: 50,width: 50,),
              Text("Regular Service",textAlign: TextAlign.center,),
          ],)
        ),
        Container(
          width: 52,
          margin: EdgeInsets.all(10),
          child:Column(
            children: [
              Image.asset("asset/img1.png",height: 50,width: 50,),
              Text("Oil change",textAlign: TextAlign.center,),
          ],)
        ),
        Container(
          margin: EdgeInsets.all(10),
          child:Column(
            children: [
              Image.asset("asset/img2.png",height: 50,width: 50,),
              Text("Checkup",textAlign: TextAlign.center,),
          ],)
        ),
        Container(
          width: 52,
          margin: EdgeInsets.all(10),
          child:Column(
            children: [
              Image.asset("asset/img2.png",height: 50,width: 50,),
              Text("Repair Job",textAlign: TextAlign.center,),
          ],)
        ),
        Container(
          width: 52,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              IconButton(icon: Icon(Icons.add),onPressed: (){},iconSize: 35,),
              Text("more",textAlign: TextAlign.center,),
            ],
          ),
        ),
        
      ]
    );
  }
}

