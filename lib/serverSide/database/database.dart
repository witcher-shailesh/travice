import 'package:cloud_firestore/cloud_firestore.dart';

class DataService{
  final String uid;
  DataService({this.uid});
  final CollectionReference referenceCollection = Firestore.instance.collection('users');

  Future updateUserData(String name,String address)async{
    return await referenceCollection.document(uid).setData({
      'Customer_name': name,
      'Customer_Address': address
    });
  } 

}