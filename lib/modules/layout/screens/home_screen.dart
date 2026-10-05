import 'package:evently/core/app_images.dart';
import 'package:evently/core/app_provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const id = 'home';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome Back ✨', style: theme.textTheme.titleLarge),
                      const SizedBox(height: 4),
                      Text('John Safwat', style: theme.textTheme.titleLarge),
                    ],
                  ),
                ),
                provider.themeMode == ThemeMode.light
                    ? ImageIcon(AssetImage(AppImages.sun))
                    : ImageIcon(AssetImage(AppImages.moon)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: .circular(8),
                    color: colorScheme.primary,
                  ),
                  child: Center(
                    child: Text(
                      provider.appLocale.languageCode.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: .w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //-------------body-----------
          ],
        ),
      ),
    );
  }
}
