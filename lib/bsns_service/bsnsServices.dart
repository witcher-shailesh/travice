import 'package:flutter/material.dart';
import 'package:travice/homepage_items/service_container.dart';

class ServiceProviderPage extends StatelessWidget {
  final ServiceContainers service;
  const ServiceProviderPage({
    this.service
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(onPressed: (){},label: Text("Book your Service"), ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.red,
        title: Text(service.serviceName),
      ),
      body: ListView(
        children: [
          Container(//SERVICE IMAGE
            margin: EdgeInsets.symmetric(horizontal:10 ,vertical: 15),
            width: double.infinity,
            height: MediaQuery.of(context).size.height/4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(image: AssetImage(service.serviceImg),fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color:Colors.grey.shade400,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(1, 3),
                )
              ]
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              //image: DecorationImage(image: AssetImage(service.serviceImg),fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                  color:Colors.grey.shade200,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(1, 3),
                )
              ]
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children:[
                GeneralFeatures(headLine: "Go Digital",subHeadline: "Convenient online payment options.",),
                GeneralFeatures(headLine: "Our Promise",subHeadline: "100% satisfaction options."),
                GeneralFeatures(headLine: "Expert Service",subHeadline: "Skilled machanics for your every need."),
                GeneralFeatures(headLine: "Service At Home ",subHeadline: "Service from the comfort of your home/farm."),
                
              ]
            ),
            ),
          
        ],
      ), 
    );
  }
}

class GeneralFeatures extends StatelessWidget {
  final String headLine,subHeadline;
  const GeneralFeatures({
    Key key,this.headLine,this.subHeadline
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width/2-40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        Text(headLine,style: TextStyle(
          fontSize:18,
          fontWeight:FontWeight.bold
        ),),
        Divider(
          thickness: 2,
          endIndent: 70,
        ),
        Text(subHeadline),
      ]
    ),);
  }
}