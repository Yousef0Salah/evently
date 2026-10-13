import 'package:evently/core/app_images.dart';
import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/core/constants/app_categories.dart';
import 'package:evently/core/services/db_service.dart';
import 'package:evently/modules/event_details/screens/event_details.dart';
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
    final provider = Provider.of<AppProvider>(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final user = FirebaseAuth.instance.currentUser!;

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
                          user.displayName ?? 'User',
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  provider.themeMode == ThemeMode.light
                      ? const ImageIcon(AssetImage(AppImages.sun))
                      : const ImageIcon(AssetImage(AppImages.moon)),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: colorScheme.primary,
                    ),
                    child: Center(
                      child: Text(
                        provider.appLocale.languageCode.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
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
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.all(8),
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
              FutureBuilder(
                future: DbService.getEvent(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    final events = snapshot.data ?? [];
                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    EventDetails(event: events[index]),
                              ),
                            );
                          },
                          child: EventWidget(
                            event: events[index],
                            onTapFav: () async {
                              await DbService.toggleFav(events[index]);
                              setState(() {});
                            },
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount: events.length,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
