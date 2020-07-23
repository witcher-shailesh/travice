import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travice/serverSide/database/database.dart';
import 'package:travice/serverSide/models/user_model.dart';

class BuyTractor extends StatefulWidget {
  @override
  _BuyTractorState createState() => _BuyTractorState();
}

class _BuyTractorState extends State<BuyTractor> {
  final _formK = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();

  final _addressController = TextEditingController();

  final _gaonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
     
    DataService dataService = DataService(uid:user.uid);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          centerTitle: true,
          title: Text("Buy Tractor"),
          automaticallyImplyLeading: true,
          backgroundColor: Colors.red,
        ),
      body: Form(
        key: _formK,
          child: ListView(
          children:[
            SizedBox(height:MediaQuery.of(context).size.height/30),
            Container(
              padding: EdgeInsets.all(20),
              child: Text("If you are interested in buying new tractor,\nthen please fill up the form.We will contact you asap !",textAlign: TextAlign.center,
              style: TextStyle(
                color:Colors.grey.shade700,
                fontSize: 20
              ),
              ),
            ),
            
              Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
              border: Border.all(
                color:Colors.grey
                
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
              
              ),
              padding: EdgeInsets.symmetric(horizontal:20,vertical: 5),
              child: TextFormField(
               controller: _nameController,
              style: TextStyle(

              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Name",
                hintStyle: TextStyle(
                  fontSize:20
                )
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter Your Name';
                }else if(value.length<10){
                  return 'Please enter full address';
                }
                return null;
              },
              ),
              ),
              Container(
              
               margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
              border: Border.all(
                color:Colors.grey
                
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
              
              ),
              padding: EdgeInsets.symmetric(horizontal:20,vertical: 5),
               
              child: TextFormField(
              controller: _addressController,
              //keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Address",
                 hintStyle: TextStyle(
                  fontSize:20
                )
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
              ),
              ),
              Container(
               margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
              border: Border.all(
                color:Colors.grey
                
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
              
              ),
              
               padding: EdgeInsets.symmetric(horizontal:20,vertical: 5),
              child: TextFormField(
              controller: _gaonController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Gao Name",
                 hintStyle: TextStyle(
                  fontSize:20
                )
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your gao name';
                }
                return null;
              },
              ),
              ),
              // Container(
              // padding: EdgeInsets.symmetric(horizontal:100),
              // child: RaisedButton(
              
              // color: Colors.red,
              // onPressed: () {
              //   //dataService.updateUserData("shailesh", "ddddd","_gaonController.text");
              //   if(_formK.currentState.validate()){
              //   //dataService.updateUserData(_nameController.text, _addressController.text,_gaonController.text);
              //   print("correct");
              
              // }
              // },
              // child: Text('Next',style: TextStyle(
              //   color:Colors.white,
              //   fontSize:20
              // ),),
              // ),
              // ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          if(_formK.currentState.validate()){
          dataService.placeQueryDetail(_nameController.text, _addressController.text,_gaonController.text);
         
          _scaffoldKey.currentState
                      .showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Request Send')));
          Future.delayed(const Duration(milliseconds: 2500), () {
            Navigator.of(context).pop();
          });
          print("correct");
          }else{
            print("false details");
          }
        },
      label: Text("Submit Details",style: TextStyle(fontSize:20),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}


// return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(  
    //     appBar: AppBar(
    //       centerTitle: true,
    //       bottom: TabBar(tabs: [
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text("New ",style: TextStyle(fontSize:20),),
    //         ),
    //         Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Text("Old",style: TextStyle(fontSize:20),),
    //         )
    //       ]),
    //       title: Text("Buy Tractor"),
    //       automaticallyImplyLeading: true,
    //       backgroundColor: Colors.red,
    //     ),
    //     body:TabBarView(children: [
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [

    //         Image(image: AssetImage("asset/new.png"),height: 300,),
    //         Text("New Tractor List"),
    //       ],),
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //         Image(image: AssetImage("asset/sell.jpg"),height: 300,),
    //         Text("Old Tractor List"),
    //       ],)
    //     ])
    //   ),
    // );