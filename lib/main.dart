import 'package:flutter/material.dart';
import 'homepage/build_travice.dart';


class TraviceInherited extends InheritedWidget{

  TraviceInherited({Key key,Widget child}) : super(key: key,child:child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;

  }
  
  TraviceInherited of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<TraviceInherited>();
  }
}


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        accentColor: Colors.red
      ),
      title: "travice",
      
      home: TraviceInherited(
        child: BuildTravice(),
      ),
    );
  }
}




