import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/core/router/app_route.dart';
import 'package:evently/core/theme/app_theme.dart';
import 'package:evently/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await GoogleSignIn.instance.initialize(
    serverClientId:
        '690091961100-kc8lbu62afo7e51aki39807fuud6e4b1.apps.googleusercontent.com',
  );

  runApp(const Evently());
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      builder: (context, child) {
        var provider = Provider.of<AppProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routes: AppRoute.routes,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: provider.appLocale,
          initialRoute: SplashPage.id,
        );
      },
    );
  }
}
