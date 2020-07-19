import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:travice/serverSide/authentication/auth.dart';
import 'package:travice/serverSide/models/user_model.dart';
import 'package:travice/wrapper/wrapper.dart';



class TraviceInherited extends InheritedWidget{

  TraviceInherited({Key key,Widget child}) : super(key: key,child:child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // ignore: todo
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
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
        supportedLocales: [
          Locale('en','US'),
          Locale('hi','IN')
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          accentColor: Colors.red
        ),
        title: "travice",
        
        home: Wrapper(),
      ),
    );
  }
}

// home: TraviceInherited(
//         child: BuildTravice(),
//       ),




