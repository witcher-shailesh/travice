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
        ServiceContainer(service: serviceContainer[0],),
        ServiceContainer(service: serviceContainer[1],),
        ServiceContainer(service: serviceContainer[2],),
        ServiceContainer(service: serviceContainer[3],),
        ServiceContainer(service: serviceContainer[4],),
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

class ServiceContainer extends StatelessWidget {
  final ServiceContainers service;
  final String imgPath,serviceName;
  
  const ServiceContainer({
    Key key, this.service,this.imgPath,this.serviceName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        margin: EdgeInsets.all(10),
        //padding: EdgeInsets.all(10)
        child:Column(
    
    children: [
      Image.asset(service.imgPath,height: 50,width: 50,),
      Text(service.serviceName,textAlign: TextAlign.center,),
        ],)
      );
  }
}


class ServiceContainers{
  final String serviceName ,imgPath;
  ServiceContainers({
    this.imgPath,
    this.serviceName,
  });
}

List<ServiceContainers> serviceContainer =[
  ServiceContainers(imgPath: "asset/img0.png",serviceName: "Quick Service",),
  ServiceContainers(imgPath: "asset/img1.png",serviceName: "Regular Service",),
  ServiceContainers(imgPath: "asset/img2.png",serviceName: "Oil change",),
  ServiceContainers(imgPath: "asset/img3.png",serviceName: "Check Up",),
  ServiceContainers(imgPath: "asset/img3.png",serviceName: "Repair Job",),
  
  

];
