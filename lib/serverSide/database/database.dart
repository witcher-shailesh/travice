import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class DataService{
  final String uid;
  DataService({this.uid});
  final CollectionReference referenceCollection = Firestore.instance.collection('users');
  final CollectionReference buyTractorReference = Firestore.instance.collection('New Tractor Queries');
  final CollectionReference orderService = Firestore.instance.collection('Service Orders');
  Future updateOrder(String orderId)async{
    return await orderService.add({
      'userId': uid,
    });
  }
  Future updateUserData(String name,String address, String gaon)async{
    return await referenceCollection.document(uid).setData({
      'Customer_name': name,
      'Customer_Address': address,
      'Customer_gao':gaon,

    });
  } 

  Future placeQueryDetail(String name,String number, String address)async{
    return await buyTractorReference.document(uid).setData({
      'Name': name,
      'Number':number,
      'Address': address,
      
    });
  }
  Future checkIfUserIsRegistered()async{
     
    }
    
  

  //get stream
  Stream<QuerySnapshot> get users {
    return  referenceCollection.snapshots();
  }


}