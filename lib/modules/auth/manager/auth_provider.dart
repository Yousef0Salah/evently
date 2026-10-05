import 'package:evently/core/toast_service/toast.dart';
import 'package:evently/modules/auth/services/auth_services.dart';
import 'package:evently/modules/layout/screens/layout_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  late User user;
  late UserCredential userCredential;

  Future<User?> createAccount({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      user = await AuthServices.createAccount(
        email: email,
        password: password,
        name: name,
      );
      // await AuthServices.verificationEmail(user: user);
      // Toast.show(title: 'Check your Email', context: context);

      Toast.show(title: 'Welcome $name', context: context);
    } catch (e) {
      Toast.show(title: e.toString(), context: context, type: ToastType.error);
    }
    isLoading = false;
    notifyListeners();
    return null;
  }

  Future<User?> signInWithGoogle({required BuildContext context}) async {
    try {
      isLoading = true;
      notifyListeners();

      userCredential = await AuthServices.signInWithGoogle();
      // await AuthServices.verificationEmail(user: user);
      // Toast.show(title: 'Check your Email', context: context);

      Toast.show(
        title: 'Welcome ${userCredential.user!.displayName}',
        context: context,
      );
              Navigator.pushReplacementNamed(context, LayoutScreen.id);

    } catch (e) {
      Toast.show(title: e.toString(), context: context, type: ToastType.error);
    }
    isLoading = false;
    notifyListeners();
    return null;
  }

  Future<User?> login({
    required String email,
    required String password,

    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      user = await AuthServices.login(email: email, password: password);

      if (user.emailVerified) {
        Toast.show(title: 'Welcome back ${user.displayName}', context: context);
        Navigator.pushReplacementNamed(context, LayoutScreen.id);
      } else {
        await user.sendEmailVerification();
        Toast.show(title: 'check your email', context: context);
      }
    } catch (e) {
      Toast.show(title: e.toString(), context: context, type: ToastType.error);
    }
    isLoading = false;
    notifyListeners();
    return null;
  }

  Future<void> resetPassword({
    required String email,

    required BuildContext context,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      await AuthServices.resetPassword(email: email);

      Toast.show(title: 'check your email', context: context);
    } catch (e) {
      Toast.show(title: e.toString(), context: context, type: ToastType.error);
    }
    isLoading = false;
    notifyListeners();
  }
}
