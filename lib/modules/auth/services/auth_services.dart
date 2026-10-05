import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static Future<User> createAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      credential.user!.updateDisplayName(name);
      credential.user!.updateProfile(displayName: name);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        throw 'The account already exists for that email.';
      } else {
        throw e.message ?? '';
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    try {
      await GoogleSignIn.instance.initialize(
        serverClientId:
            '690091961100-kc8lbu62afo7e51aki39807fuud6e4b1.apps.googleusercontent.com',
      );
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn.instance
          .authenticate();
      
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
   
      
    } catch (e) {
      
      rethrow;
    }
  }

  static Future<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found') {
      //   throw ('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   throw ('Wrong password provided for that user.');
      // } else {
      //   throw e.message ?? '';
      // }
      throw 'Invalid Email or Password';
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw 'Invalid Email';
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> verificationEmail({required User user}) async {
    try {
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Failed to send verification email';
    } catch (e) {
      rethrow;
    }
  }
}
