import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth fbAuth = FirebaseAuth.instance;
  Future<void> createUser (String email , String password) async{
    await fbAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
  Future<void> signInUser (String email , String password) async{
    await fbAuth.signInWithEmailAndPassword(email: email, password: password);
  }
}