import 'package:evently/core/constants/app_categories.dart';
import 'package:flutter/material.dart';

class TapWidget extends StatelessWidget {
  const TapWidget({
    super.key,
    required this.categories,
    required this.isSelected,
  });
  final AppCategories categories;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 40,
        decoration: BoxDecoration(
          borderRadius: .circular(16),
          color: isSelected ? colorScheme.primary : Colors.white,
          border: BoxBorder.all(color: theme.dividerColor),
        ),
        child: Row(
          children: [
            Icon(
              categories.icon,
              color: isSelected ? Colors.white : colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              categories.name,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
