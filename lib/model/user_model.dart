import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
final String? fullName;
final String? email;
UserModel({required this.fullName ,required this.email});
factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc){
  return UserModel(fullName: doc["fullName"], email: doc["email"]);
}
Map<String , dynamic> toJson (){
  return {
  'fullName':fullName,
  'email':email,
  };
}
}