import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService
{

  static AuthService authService =AuthService._();
  AuthService._();
  final FirebaseAuth auth =FirebaseAuth.instance;

  void account(String email,String password)
  {
    Future<UserCredential> userCredential =auth.createUserWithEmailAndPassword(email: email, password: password);
  }




}