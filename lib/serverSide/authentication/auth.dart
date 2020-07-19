
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travice/pages/loading/loading.dart';
import 'package:travice/serverSide/models/user_model.dart';

class AuthService{
final FirebaseAuth _auth = FirebaseAuth.instance;

// create user object
User _userFromFirebase(FirebaseUser user){
  return user!=null?User(uid: user.uid) :null;
}

//auth change user stream
Stream<User> get user{
  return _auth.onAuthStateChanged
    .map(_userFromFirebase);
}



//signin annonoumously


Future signInAnon() async{
  try{
    AuthResult result = await _auth.signInAnonymously();

    FirebaseUser user = result.user;
    
    return _userFromFirebase(user);
  }catch(e){
    print(e.toString());
    return null;
  }
}

//signin with email

//signout
Future signout() async{
  try{
    return await _auth.signOut();
  }catch(e){
    print(e.toString());
    return null;
  }
}
final _codeController = TextEditingController();
//signin using number
Future signInUsingPhone(String phn ,BuildContext context)async{
  final PhoneVerificationCompleted verificationCompleted = (AuthCredential cred)async{
    //Navigator.of(context).pop();
    AuthResult result = await _auth.signInWithCredential(cred);
    FirebaseUser user = result.user;
    if(user!=null){
      return _userFromFirebase(user);
    }else
    {
      print("error here");
    }
  };
  final PhoneVerificationFailed verificationFailed = (AuthException e){
    print(e.message.toString());
  };
  final PhoneCodeAutoRetrievalTimeout autoRetrieval = (String verID){

  };

  
  

  await _auth.verifyPhoneNumber(
    phoneNumber: phn,
    timeout: const Duration(seconds:20),
    verificationCompleted: verificationCompleted,
    verificationFailed: verificationFailed,
    codeSent: (String verId,[int forceResendingToken]){
      Loading();
      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (context){
      //     return AlertDialog(
      //       title: Text("Give the code"),
      //       content: Column(
      //         children: [
      //           TextField(
      //             controller: _codeController
      //           )

      //         ],),
      //       actions: [
      //         RaisedButton(
      //           onPressed: ()async{
      //             final code = _codeController.text;
      //             AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verId, smsCode: code);
      //             AuthResult result = await _auth.signInWithCredential(credential);
      //             FirebaseUser user = result.user;
      //             if(user!=null){
      //               return _userFromFirebase(user);
      //             }else{
      //               print("error");
      //             }
      //           },
      //           child:Text("Confirm"),
      //         )
      //       ],
      //     );
      //   }
      // );
    },
    codeAutoRetrievalTimeout: autoRetrieval);
  }


}