import 'package:flutter/material.dart';

import 'package:travice/pages/user_authonticate/login.dart';
import 'package:travice/serverSide/authentication/auth.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size.height);
    return Scaffold(
        
        body: SafeArea(
          child:ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //SizedBox(height: MediaQuery.of(context).size.height/8,),
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
                          SizedBox(height: MediaQuery.of(context).size.height/3,),

                          GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context, 
                                    PageRouteBuilder(
                                      pageBuilder: (context,animation,secondaryAnimation) => LogIn(),
                                      transitionsBuilder:(context, animation, secondaryAnimation, child) {
                                          // var begin = Offset(0.0, 1.0);
                                          // var end = Offset.zero;
                                          // var curve = Curves.ease;

                                          // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                          return SizeTransition(
                                            sizeFactor: animation,
                                            //position: animation.drive(tween),
                                            child: child,
                                          );
                                        },
                                    )
                                );
                              },
                              child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 30,),
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
                                borderRadius: BorderRadius.circular(25)
                              ),
                              child: Text("Get Started",style: TextStyle(color:Colors.white,fontSize: 20),),
                            ),
                          ),
                          // GestureDetector(
                          //   onTap: (){
                          //       Navigator.push(
                          //           context, 
                          //           PageRouteBuilder(
                          //             pageBuilder: (context,animation,secondaryAnimation) => LogIn(),
                          //             transitionsBuilder:(context, animation, secondaryAnimation, child) {
                          //                 var begin = Offset(0.0, 1.0);
                          //                 var end = Offset.zero;
                          //                 var curve = Curves.ease;

                          //                 var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                          //                 return SizeTransition(
                          //                   sizeFactor: animation,
                          //                   //position: animation.drive(tween),
                          //                   child: child,
                          //                 );
                          //               },
                          //           )
                          //       );
                          //     },
                          //     child: Container(
                          //     alignment: Alignment.center,
                          //     margin: EdgeInsets.only(top:40,left:30,right:30),
                          //     padding: EdgeInsets.symmetric(vertical:20),
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //       boxShadow: [
                          //         BoxShadow(
                          //           blurRadius:10,
                          //           spreadRadius: 2,
                          //           offset: Offset(5, 10),
                          //           color:Colors.red.shade100
                          //           )
                          //       ],
                          //       border: Border.all(
                          //         color: Colors.red
                          //       ),
                          //       color:Colors.white,
                          //       borderRadius: BorderRadius.circular(25)
                          //     ),
                          //     child: Text("Log In",style: TextStyle(color:Colors.red,fontSize: 20),),
                          //   ),
                          // ),
                        ],
                      )                  
                    ]
              )
        ),
      );
    
  }
}
