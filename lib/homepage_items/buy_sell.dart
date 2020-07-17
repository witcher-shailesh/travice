import 'package:flutter/material.dart';
import 'package:travice/BuySellServices/buyTractor.dart';
import 'package:travice/BuySellServices/sellTractor.dart';

class BuySellTractor extends StatelessWidget {
  const BuySellTractor({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BuySellService(
          imgPath: "asset/new.png",
          serviceName: "Buy Tractor",
          press: () => Navigator.push(context, PageRouteBuilder(pageBuilder: (
            context,animation,secondaryAnimation)=> BuyTractor())),
        ),
        BuySellService(
          imgPath: "asset/sell.jpg", 
          serviceName: "Sell Your Tractor",
          press: () => Navigator.push(context, PageRouteBuilder(pageBuilder: (
            context,animation,secondaryAnimation)=> SellTractor())),
          ),
          
      ],
    );
  }
}

class BuySellService extends StatelessWidget {//Buy sell container
  final String imgPath,serviceName;
  final Function press;
  
  const BuySellService({
    Key key,@required this.imgPath,@required this.serviceName,this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: GestureDetector(
      onTap: press,
              child: Container(
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
              Image.asset(imgPath,height: 100,),
              Text(serviceName)
            ]
          ),
        ),
    ));
  }
}