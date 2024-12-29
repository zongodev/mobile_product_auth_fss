import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:product_auth_fss/model/user_model.dart';

class UserService{
  final FirebaseFirestore collectionReference = FirebaseFirestore.instance;
  Future<void> addUser(UserModel user, String userID) async{
    await collectionReference.collection("users").doc(userID).set(user.toJson());

  }
}