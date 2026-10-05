import 'package:evently/core/app_images.dart';
import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/modules/layout/screens/favorite_screen.dart';
import 'package:evently/modules/layout/screens/home_screen.dart';
import 'package:evently/modules/layout/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});
  static const String id = 'layout';
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final List<Widget> bodyWidget = const [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: .circular(24),
          topRight: .circular(24),
        ),

        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.lightMainColor,
          selectedIconTheme: IconThemeData(color: colorScheme.primary),
          elevation: 0,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.heart),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.user),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: bodyWidget[index],
    );
  }
}
