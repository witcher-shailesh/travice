import 'package:flutter/material.dart';
import 'package:travice/pages/bsns_service/bsnsServices.dart';

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
        ServiceContainer(service: serviceContainer[0] ,press:() => Navigator.push(
          context, 
          buildPageRouteBuilder(serviceContainer[0]),
          ),
        ),
        ServiceContainer(service: serviceContainer[1] ,press:() => Navigator.push(
          context, 
          buildPageRouteBuilder(serviceContainer[1]),
          ),
        ),
        ServiceContainer(service: serviceContainer[2] ,press:() => Navigator.push(
          context, 
          buildPageRouteBuilder(serviceContainer[2]),
          ),
        ),
        ServiceContainer(service: serviceContainer[3] ,press:() => Navigator.push(
          context, 
          buildPageRouteBuilder(serviceContainer[3]),
          ),
        ),
        ServiceContainer(service: serviceContainer[4] ,press:() => Navigator.push(
          context, 
          buildPageRouteBuilder(serviceContainer[4]),
          ),
        ),
        
        Container(
          width: MediaQuery.of(context).size.width/3-40,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              IconButton(icon: Icon(Icons.arrow_downward),onPressed: (){},iconSize: 35,),
              Text("more",textAlign: TextAlign.center,),
            ],
          ),
        ),
        
      ]
    );
  }

  PageRouteBuilder buildPageRouteBuilder(ServiceContainers service) {
    return PageRouteBuilder(pageBuilder: (context,animation,
        secondaryAnimation) => ServiceProviderPage(service: service,),
        transitionsBuilder:(context, animation, secondaryAnimation, child) {
            // var begin = Offset(0.0, 1.0);
            // var end = Offset.zero;
            // var curve = Curves.ease;

            // = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SizeTransition(
              sizeFactor: animation,
              //position: animation.drive(tween),
              child: child,
            );
          },
        );
  }
}

class ServiceContainer extends StatelessWidget {
  final ServiceContainers service;
  final String imgPath,serviceName;
  final Function press;
  
  const ServiceContainer({
    Key key, this.service,this.imgPath,this.serviceName,this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
      width: MediaQuery.of(context).size.width/3-40,
      margin: EdgeInsets.all(10),
      child:Column(
        children: [
          Image.asset(service.imgPath,height: 50,width: 50,),
          SizedBox(height:10),
          Text(service.serviceName,textAlign: TextAlign.center,),
          ],
        )
      ),
    );
  }
}


class ServiceContainers{
  final String serviceName ,imgPath,serviceImg,facilityProvided;
  final List<Text> facilities;
  ServiceContainers({
    this.imgPath,
    this.serviceName,
    this.facilityProvided,
    this.serviceImg,
    this.facilities,
  });
}

List<ServiceContainers> serviceContainer =[
  ServiceContainers(
    imgPath: "asset/img0.png",
    serviceName: "General Service",
    serviceImg: "asset/serviceImages/gService.jpg",
    ),
  ServiceContainers(
    imgPath: "asset/img1.png",
    serviceName: "Greasing",
    serviceImg: "asset/serviceImages/greasing.jpg",
    ),
  ServiceContainers(
    imgPath: "asset/img2.png",
    serviceName: "Damage Repair",
    serviceImg: "asset/serviceImages/damageRepair.jpg",
    ),
  ServiceContainers(
    imgPath: "asset/img3.png",
    serviceName: "Check Up",
    serviceImg: "asset/serviceImages/checkUp.jpg",
    ),
  ServiceContainers(
    imgPath: "asset/img3.png",
    serviceName: "Accessories",
    serviceImg: "asset/serviceImages/accessories.jpg",
    ),
  
  

];



