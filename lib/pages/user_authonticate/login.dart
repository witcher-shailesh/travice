import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travice/pages/user_authonticate/getDeatails.dart';
import 'package:travice/serverSide/authentication/auth.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _numberController = TextEditingController();
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  WidgetMarker currentStatus = WidgetMarker.mobile;
  bool loading =false;
  String number ;
  @override
  Widget build(BuildContext context) {
    
   
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade50,
        title:Text("Get Started",style: TextStyle(color:Colors.red),),
        automaticallyImplyLeading: true, 
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        height:MediaQuery.of(context).size.height,
        decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color:Colors.grey.shade200,
              spreadRadius: 10,
              blurRadius: 20,
              
            )
          ]
        ),
        child: ListView(
          children:[
            getCustomContainer(),

          ]
        ),

      )
    );
  }
  Widget getCustomContainer() {
  switch (currentStatus) {
    case WidgetMarker.mobile:
      return MobileVerification(formKey: _formKey, numberController: _numberController, auth: _auth,currentStatus: currentStatus,);
    case WidgetMarker.otp:
      return Column(
        children:[
          TextFormField(
                      maxLength: 10,
                      validator: (val) => val.isEmpty?"Please enter your mobile no.": val.length<10?"Enter 10 digits Mobile No.":null,
                      controller: _numberController,
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.grey.shade700,
                      cursorWidth: 3,
                      style: TextStyle(
                        fontSize:20,
                        color:Colors.grey.shade700
                      ),
                      decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          hintText: "Enter 10 digits Mobile No.",
                          hintStyle:TextStyle(fontSize: 18, color:Colors.grey.shade700)
                          
                        
                        ),
                    
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.red)
                    ),
                    onPressed: ()async{
                      setState(() {
                        currentStatus = WidgetMarker.details;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width/3,
                      padding: EdgeInsets.all(15),
                      child: Text("Get Otp",style: TextStyle(
                        color:Colors.white,
                        fontSize:18,
                      ),)),
                    color: Colors.red,
                    
                    
                    )
        ]
      );
    case WidgetMarker.details:
      return Column(

      );
  }

  return MobileVerification(formKey: _formKey, numberController: _numberController, auth: _auth ,currentStatus: currentStatus, );
  }
}

enum WidgetMarker{mobile,otp,details}



class MobileVerification extends StatefulWidget {      


   MobileVerification({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required TextEditingController numberController,
    @required AuthService auth,
    @required WidgetMarker currentStatus,
  }) : _formKey = formKey, _numberController = numberController, _auth = auth, _currentStatus=currentStatus, super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController _numberController;
  final AuthService _auth;
  WidgetMarker _currentStatus;
  

  @override
  _MobileVerificationState createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget._formKey,
        child: Column(
        children:[
          SizedBox(height: MediaQuery.of(context).size.height/10,),
          Text("Mobile Verification",style: TextStyle(
            fontSize:25,
            fontWeight:FontWeight.bold,
            color:Colors.grey.shade700
          ),),
          SizedBox(height:5),
          Text("Please enter your phone number",style: TextStyle(
            //fontSize:25,
            //fontWeight:FontWeight.bold,
            color:Colors.grey.shade700,
            letterSpacing: 2
          ),
          
          ),
          SizedBox(height:MediaQuery.of(context).size.height/15),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:Colors.grey.shade700
              ) 
            ),
            margin: EdgeInsets.all(15),
            child: Row(
              children: [
                Container(
                height: 70,
                padding: EdgeInsets.all(15),
                color: Colors.grey.shade200,
                alignment: Alignment.center,
                width: 70,
                child: Text("+91",style: TextStyle(fontSize: 20, color:Colors.grey.shade700),),
                  ),
                SizedBox(width:10),
                Expanded(
                  flex: 4,
                    child: TextFormField(
                      maxLength: 10,
                      validator: (val) => val.isEmpty?"Please enter your mobile no.": val.length<10?"Enter 10 digits Mobile No.":null,
                      controller: widget._numberController,
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.grey.shade700,
                      cursorWidth: 3,
                      style: TextStyle(
                        fontSize:20,
                        color:Colors.grey.shade700
                      ),
                      decoration: InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          hintText: "Enter 10 digits Mobile No.",
                          hintStyle:TextStyle(fontSize: 18, color:Colors.grey.shade700)
                          
                        
                        ),
                    
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:20),
          RaisedButton(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.red)
            ),
            onPressed: ()async{
              if(widget._formKey.currentState.validate()){
                final pnumber = "+91"+widget._numberController.text;
                await widget._auth.signInUsingPhone(pnumber, context);
                
              }else{
                print("incorrect");
                setState(() {
                  widget._currentStatus = WidgetMarker.otp;
                });
                
                    
                
              // final pnumber = "+91"+_numberController.text;
              // await _auth.signInUsingPhone(pnumber, context);
              
              } 
            },
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width/3,
              padding: EdgeInsets.all(15),
              child: Text("Get Otp",style: TextStyle(
                color:Colors.white,
                fontSize:18,
              ),)),
            color: Colors.red,
            
            
            )
        ]
      ),
    );
  }
}

