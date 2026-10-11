import 'package:evently/core/app_images.dart';
import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/modules/auth/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const id = 'profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var user = FirebaseAuth.instance.currentUser!;
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              const SizedBox(height: 70, width: double.infinity),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(AppImages.profile),
              ),
              const SizedBox(height: 16),
              Text(user.displayName!, style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(user.email!, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 24),
              Container(
                height: 48,

                padding: .all(8),
                decoration: BoxDecoration(
                  borderRadius: .circular(16),
                  color: theme.colorScheme.surface,
                  border: Border.all(color: theme.dividerColor),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Dark mode',
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Switch(
                        value: provider.themeMode == ThemeMode.dark,
                        onChanged: (value) {
                          value
                              ? provider.changeTheme(ThemeMode.dark)
                              : provider.changeTheme(ThemeMode.light);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    showDragHandle: true,
                    isDismissible: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Text(
                                'Language',
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                provider.changeLanguage('ar');
                              },
                              child: Container(
                                height: 48,
                                padding: .all(8),
                                decoration: BoxDecoration(
                                  borderRadius: .circular(16),
                                  color: theme.colorScheme.surface,
                                  border: Border.all(
                                    color: provider.appLocale == Locale('ar')
                                        ? theme.colorScheme.primary
                                        : theme.dividerColor,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Arabic',
                                        style: theme.textTheme.titleMedium,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {
                                provider.changeLanguage('en');
                              },
                              child: Container(
                                height: 48,
                                padding: .all(8),
                                decoration: BoxDecoration(
                                  borderRadius: .circular(16),
                                  color: theme.colorScheme.surface,
                                  border: Border.all(
                                    color: provider.appLocale == Locale('en')
                                        ? theme.colorScheme.primary
                                        : theme.dividerColor,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'English',
                                        style: theme.textTheme.titleMedium,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 48,
                  padding: .all(8),
                  decoration: BoxDecoration(
                    borderRadius: .circular(16),
                    color: theme.colorScheme.surface,
                    border: Border.all(color: theme.dividerColor),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Language',
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, LoginScreen.id);
                },
                child: Container(
                  height: 48,
                  padding: .all(8),
                  decoration: BoxDecoration(
                    borderRadius: .circular(16),
                    color: theme.colorScheme.surface,

                    border: Border.all(color: theme.dividerColor),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Logout',
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      Icon(Icons.logout, color: Colors.red),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
