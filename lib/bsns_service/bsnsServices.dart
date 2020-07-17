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
      
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.red,
        title: Text(service.serviceName),
      ),
      body: Center(
        //child:Text()
      ),
    );
  }
}