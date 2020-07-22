import 'package:cloud_firestore/cloud_firestore.dart';

class DataService{
  final String uid;
  DataService({this.uid});
  final CollectionReference referenceCollection = Firestore.instance.collection('users');

  Future updateUserData(String name,String address, String gaon)async{
    return await referenceCollection.document(uid).setData({
      'Customer_name': name,
      'Customer_Address': address,
      'Customer_gao':gaon,

    });
  } 
  Future checkIfUserIsRegistered()async{
     
    }
    
  

  //get stream
  Stream<QuerySnapshot> get users {
    return  referenceCollection.snapshots();
  }


}