import 'package:flutter/material.dart';
import 'package:travice/pages/settings/settings.dart';

import 'home_page.dart';

class BuildTravice extends StatefulWidget {
  @override
  _BuildTraviceState createState() => _BuildTraviceState();
}

class _BuildTraviceState extends State<BuildTravice> {
  int _selectedIndex = 0;
  List<Widget> _widgets = [
    HomePage(),
    Center(child: Text("message"),),
    Center(child: Text("locate"),),
    Settings(),

  ];
  void ontap(int index){
    setState((){
      _selectedIndex=index;
    });
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:Text(_selectedIndex==0?"travice":_selectedIndex==1?"message":_selectedIndex==2?"locate":"settings",style: TextStyle(color:Colors.red,fontWeight:FontWeight.bold,fontSize: 25),),
        backgroundColor: Colors.grey.shade50,
        actions: [
          IconButton(icon: Icon(Icons.language), onPressed: (){})
        ],
        actionsIconTheme: IconThemeData(
          color:Colors.red
        ),
      ),
      // 
      body: _widgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontap,
        currentIndex: _selectedIndex,
        
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        //selectedFontSize: 0,
        
        
        selectedItemColor: Colors.red,
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("tractor")),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          title: Text("khaad/seeds")),
        
        BottomNavigationBarItem(
          icon: Icon(Icons.pin_drop),
          title: Text("locate")),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("settings")),
        ],
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.phone)),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}