import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign Up
  Future<User?> signUp(String email, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("User Created Successfully: ${credential.user?.email}");
      return credential.user;

    } on FirebaseAuthException catch (e) {
      print("Signup Error Code: ${e.code}");
      print("Signup Error Message: ${e.message}");
      return null;

    } catch (e) {
      print("Unexpected Signup Error: $e");
      return null;
    }
  }

  // Login
  Future<User?> login(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("Login Success: ${credential.user?.email}");
      return credential.user;

    } on FirebaseAuthException catch (e) {
      print("Login Error Code: ${e.code}");
      print("Login Error Message: ${e.message}");
      return null;

    } catch (e) {
      print("Unexpected Login Error: $e");
      return null;
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
