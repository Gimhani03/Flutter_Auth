import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> signUpUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      // Create user in Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user !=null){
        await user.sendEmailVerification();
      }

      // Get the created user's UID
      String uid = userCredential.user!.uid;

      // Store user details in Firestore
      await _firestore.collection('users').doc(uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'createdAt': DateTime.now(),
      });

      return "Success, Veification email sent. Please check your inbox.";
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e);
    } catch (e) {
      return "An unexpected error occured. Please try again.";
    }
    // ignore: dead_code
    return null;
  }

  // Error Handling Function
  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "The email address is already in use.";
      case 'invalid-email':
        return "The email address is not valid.";
      case 'weak-password':
        return "The password is too weak.";
      default:
        return "An error occurred: ${e.message}";
    }
  }
}

