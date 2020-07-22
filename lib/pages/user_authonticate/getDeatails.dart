import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travice/serverSide/database/database.dart';
import 'package:travice/serverSide/models/user_model.dart';

class GetDetails extends StatefulWidget {
  @override
  _GetDetailsState createState() => _GetDetailsState();
}

class _GetDetailsState extends State<GetDetails> {
  final _formK = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _gaonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
     
     DataService dataService = DataService(uid:user.uid);
     
     print(user.uid);
    return Scaffold(
      body: Form(
        key: _formK,
              child: ListView(

          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height/7,
            child: Text("Enter Your Details",style: TextStyle(
            color:Colors.red,
            fontSize:25,
            fontWeight:FontWeight.bold
            ),),
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
            Container(
            padding: EdgeInsets.symmetric(horizontal:100),
            child: RaisedButton(
            
            color: Colors.red,
            onPressed: () {
              //dataService.updateUserData("shailesh", "ddddd","_gaonController.text");
              if(_formK.currentState.validate()){
              dataService.updateUserData(_nameController.text, _addressController.text,_gaonController.text);
              
            
            }
            },
            child: Text('Next',style: TextStyle(
              color:Colors.white,
              fontSize:20
            ),),
            ),
            ),
            
          ],
        ),
      ),
    );
  }
}