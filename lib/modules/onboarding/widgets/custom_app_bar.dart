import 'package:evently/core/app_images.dart';
import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/modules/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.height = kToolbarHeight,
    required this.controller,
    required this.currentPage,
  });

  final PageController controller;
  final double height;
  final int currentPage;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var provider = Provider.of<AppProvider>(context);
    final localizations = AppLocalizations.of(context);

    return AppBar(
      automaticallyImplyLeading: false,
      leading: Visibility(
        visible: currentPage != 0,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: InkWell(
            onTap: () {
              controller.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            child: Container(
              alignment: provider.appLocale == Locale('ar')
                  ? .centerLeft
                  : .centerRight,
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: .circular(8),
                border: Border.all(color: theme.dividerColor),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: colorScheme.onSurface,
                size: 24,
              ),
            ),
          ),
        ),
      ),
      elevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
      title: Image.asset(
        AppImages.evently,
        width: 142,
        color: colorScheme.primary,
      ),
      centerTitle: true,
      actionsPadding: EdgeInsets.all(8),
      actions: [
        Visibility(
          visible: currentPage != 2,
          child: InkWell(
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              LoginScreen.id,
              (_) => false,
            ),
            child: Container(
              padding: .symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: .circular(8),
                border: Border.all(color: theme.dividerColor),
              ),
              child: Text(
                localizations!.skip,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: .w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
