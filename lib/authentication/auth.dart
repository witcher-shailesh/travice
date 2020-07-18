import 'package:firebase_auth/firebase_auth.dart';
import 'package:travice/models/user_model.dart';

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
}