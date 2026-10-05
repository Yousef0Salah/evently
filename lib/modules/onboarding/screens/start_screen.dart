import 'package:evently/core/app_images.dart';
import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/modules/onboarding/screens/onboarding.dart';
import 'package:evently/modules/onboarding/widgets/custome_large_button.dart';
import 'package:evently/modules/onboarding/widgets/selected_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class startScreen extends StatelessWidget {
  const startScreen({super.key});
  static const String id = 'startScreen';

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var provider = Provider.of<AppProvider>(context);
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'logo',
                child: Center(
                  child: Image.asset(
                    AppImages.evently,
                    width: 142,
                    color: colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Image.asset(
                AppImages.beingCreative,
                color: colorScheme.onSurface,
              ),
              const SizedBox(height: 24),
              Text(
                localizations!.personalizeExperience,
                style: theme.textTheme.titleLarge,
              ),
              Text(
                localizations.personalizeExperienceDescription,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      localizations.language,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SelectedWidget(
                    isSelected: provider.appLocale == Locale('en'),
                    title: localizations.english,
                    onPressed: () {
                      provider.changeLanguage('en');
                    },
                  ),
                  const SizedBox(width: 8),
                  SelectedWidget(
                    title: localizations.arabic,
                    isSelected: provider.appLocale == Locale('ar'),
                    onPressed: () {
                      provider.changeLanguage('ar');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      localizations.theme,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  SelectedWidget.icon(
                    icon: AppImages.sun,
                    isSelected: provider.themeMode == ThemeMode.light,
                    onPressed: () {
                      provider.changeTheme(ThemeMode.light);
                    },
                  ),
                  const SizedBox(width: 8),
                  SelectedWidget.icon(
                    isSelected: provider.themeMode == ThemeMode.dark,
                    icon: AppImages.moon,
                    onPressed: () {
                      provider.changeTheme(ThemeMode.dark);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomeLargeButton(
                title: localizations.letsStart,
                onPressed: () {
                  Navigator.pushNamed(context, Onboarding.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
