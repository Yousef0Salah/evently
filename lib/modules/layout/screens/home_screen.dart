import 'package:evently/core/app_images.dart';
import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/core/constants/app_categories.dart';
import 'package:evently/modules/layout/widgets/event_widget.dart';
import 'package:evently/modules/layout/widgets/tap_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    var user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back ✨',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user.displayName!,
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  provider.themeMode == ThemeMode.light
                      ? ImageIcon(AssetImage(AppImages.sun))
                      : ImageIcon(AssetImage(AppImages.moon)),
                  const SizedBox(width: 8),
                  Container(
                    padding: .all(4),
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
              const SizedBox(height: 16),
              DefaultTabController(
                length: AppCategories.categories.length + 1,
                child: TabBar(
                  onTap: (value) {
                    currentIndex = value;
                    setState(() {});
                  },
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  tabAlignment: .start,
                  padding: .all(0),
                  labelPadding: .all(8),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    TapWidget(
                      categories: AppCategories(
                        id: 'all',
                        name: 'All',
                        image: AppImages.heart,
                        icon: Icons.menu,
                      ),
                      isSelected: currentIndex == 0,
                    ),
                    ...AppCategories.categories.map((e) {
                      return TapWidget(
                        categories: e,
                        isSelected:
                            currentIndex ==
                            AppCategories.categories.indexOf(e) + 1,
                      );
                    }),
                  ],
                ),
              ),
             
              //-------------body-----------
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => EventWidget(),
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemCount: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
