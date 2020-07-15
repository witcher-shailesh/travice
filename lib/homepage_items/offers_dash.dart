import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 180,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds:1000),
          aspectRatio: 16/9,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: [
          Container(
            
            //child: Text("SHAILESh"),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage('asset/demo1.jpg'),fit: BoxFit.fill)
            ),
          ),
          Container(
            
            //child: Text("SHAILESh"),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: AssetImage('asset/demo0.jpg'),fit: BoxFit.fill)
            ),
          ),
          // Container(
            
          //   //child: Text("SHAILESh"),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(20),
          //     image: DecorationImage(image: AssetImage('asset/demo2.jpg'),fit: BoxFit.fill)
          //   ),
          // ),
        ],
        ),
    );
  }
}