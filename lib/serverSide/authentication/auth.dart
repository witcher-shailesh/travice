
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
//signin using number
Future signInUsingPhone(String phn ,BuildContext context)async{
  // final user = Provider.of<User>(context);
  final PhoneVerificationCompleted verificationCompleted = (AuthCredential cred)async{
    
    AuthResult result = await _auth.signInWithCredential(cred);
    FirebaseUser user = result.user;
    //Navigator.of(context).pop();
    if(user!=null){
      //Navigator.of(context).pop();
      return _userFromFirebase(user);
    }else
    {
      print("error here");
    }
  };
  final PhoneVerificationFailed verificationFailed = (AuthException e){
    print("verification failed");
  };
  final PhoneCodeAutoRetrievalTimeout autoRetrieval = (String verID){
  };
  await _auth.verifyPhoneNumber(
    phoneNumber: phn,
    timeout: const Duration(seconds:60),
    verificationCompleted: verificationCompleted,
    verificationFailed: verificationFailed,
    codeSent: (String verId,[int forceResendingToken]){
        Scaffold(
                      body: Column(
                children: [
                  Loading(),
                  
                  Text("Loading"),

                
                ],
            ),
          );
    },
    codeAutoRetrievalTimeout: autoRetrieval);
  }


}