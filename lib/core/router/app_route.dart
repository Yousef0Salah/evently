import 'package:evently/modules/auth/screens/forget_password_screen.dart';
import 'package:evently/modules/auth/screens/login_screen.dart';
import 'package:evently/modules/auth/screens/singup_screen.dart';
import 'package:evently/modules/layout/screens/favorite_screen.dart';
import 'package:evently/modules/layout/screens/home_screen.dart';
import 'package:evently/modules/layout/screens/layout_screen.dart';
import 'package:evently/modules/layout/screens/profile_screen.dart';
import 'package:evently/modules/onboarding/screens/onboarding.dart';
import 'package:evently/modules/onboarding/screens/start_screen.dart';
import 'package:evently/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static final Map<String, Widget Function(BuildContext)> routes = {
    SplashPage.id: (_) => const SplashPage(),
    startScreen.id: (_) => const startScreen(),
    Onboarding.id: (_) => const Onboarding(),
    LoginScreen.id: (_) => const LoginScreen(),
    SingupScreen.id: (_) => const SingupScreen(),
    ForgetPasswordScreen.id: (_) => ForgetPasswordScreen(),
    LayoutScreen.id: (_) => LayoutScreen(),
    HomeScreen.id: (_) => const HomeScreen(),
    FavoriteScreen.id: (_) => const FavoriteScreen(),
    ProfileScreen.id: (_) => const ProfileScreen(),
  };
}
