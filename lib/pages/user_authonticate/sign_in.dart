import 'package:flutter/material.dart';
import 'package:travice/pages/loading/loading.dart';
import 'package:travice/serverSide/authentication/auth.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: SafeArea(
          child:ListView(
                    children: [
                      Form(
                        key: _formKey,
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: ()async{
                                  dynamic result = await _auth.signInAnon();
                                  if(result==null){
                                    print("erroe sign in");
                                  }else{
                                    print("signed in");
                                    print(result.uid);
                                  }
                                },
                                child: Container(
                                height: MediaQuery.of(context).size.height/8,
                                alignment: Alignment.centerRight,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text("Skip Login",
                                  style: TextStyle(
                                    fontSize:17,
                                    color:Colors.red
                                  ),
                                  )
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Image.asset("asset/new.png",height: MediaQuery.of(context).size.height/6,)),

                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text("VIP Kisan",style:TextStyle(
                                fontSize:45,
                                fontWeight:FontWeight.bold,
                                color: Colors.red.shade800
                                )
                              ),
                            ),
                            Text("we deliver services to kisan",style:TextStyle(
                              fontSize:20,
                              letterSpacing: 2,
                              )
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height/7,),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:Colors.grey.shade700
                                ) 
                              ),
                              margin: EdgeInsets.symmetric(horizontal:20,vertical:20),
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
                                    ),
                                ],
                              ),
                            ),
                            GestureDetector(
                                onTap: ()async{
                                  if(_formKey.currentState.validate()){ 
                                    Loading();  
                                    final pnumber = "+91"+_numberController.text;
                                    await _auth.signInUsingPhone(pnumber, context);  
                                                                    
                                  }else{
                                    print("incorrect");                               
                                  } 
                                 },
                                child: Container(
                                alignment: Alignment.center,
                                height: 70,
                                margin: EdgeInsets.symmetric(horizontal: 20,),
                                padding: EdgeInsets.symmetric(vertical:20),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  
                                  boxShadow: [
                                    BoxShadow(
                                      
                                      blurRadius:10,
                                      spreadRadius: 2,
                                      offset: Offset(5, 10),
                                      color:Colors.red.shade100
                                      )
                                  ],
                                  color:Colors.red,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text("Get Started",style: TextStyle(color:Colors.white,fontSize: 20),),
                              ),
                            ),
                            
                          ],
                        ),
                      )                  
                    ]
              )
        ),
      );
    
  }
}
