import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_auth_fss/model/user_model.dart';

class UserService{
  final CollectionReference collectionReference = FirebaseFirestore.instance.collection("users");
  Future<void> addUser(UserModel user) async{
    await collectionReference.add(user.toJson());

  }
}