import 'package:animate_do/animate_do.dart';
import 'package:evently/core/app_images.dart';
import 'package:evently/modules/onboarding/screens/start_screen.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String id = '/';
  @override
  Widget build(BuildContext context) {
    // ThemeData theme = Theme.of(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ZoomIn(
                duration: Duration(seconds: 2),
                child: Hero(
                  tag: 'logo',
                  child: Center(
                    child: Image.asset(
                      AppImages.evently,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
            FadeInUp(
              delay: Duration(seconds: 2),
              onFinish: (direction) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => startScreen()),
                );
              },
              child: Image.asset(
                AppImages.pranding,
                color: colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
