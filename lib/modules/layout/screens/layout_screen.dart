import 'package:evently/core/app_images.dart';
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
      // backgroundColor: theme.scaffoldBackgroundColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: .circular(24),
          topRight: .circular(24),
        ),

        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(color: colorScheme.primary),
          elevation: 0,
          currentIndex: index,

          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppImages.home)),
              activeIcon: ImageIcon(AssetImage(AppImages.selectedHome)),

              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppImages.heart)),
              activeIcon: ImageIcon(AssetImage(AppImages.selectedHeart)),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(AppImages.user)),
              activeIcon: ImageIcon(AssetImage(AppImages.selectedUser)),

              label: 'Profile',
            ),
          ],
        ),
      ),
      body: bodyWidget[index],
    );
  }
}
