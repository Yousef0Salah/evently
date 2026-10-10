import 'package:evently/core/app_images.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;

    return Container(
      width: double.infinity,
      height: 200,

      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        image: DecorationImage(
          image: AssetImage(AppImages.birthday),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .spaceBetween,
          children: [
            Container(
              padding: .all(8),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: .circular(8),
                border: Border.all(color: theme.dividerColor),
              ),
              child: Text(
                '21 Jan',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w600,
                  color: colorScheme.primary,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: .circular(8),
                border: Border.all(color: theme.dividerColor),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'This is a Birthday Party ',
                    style: TextStyle(fontSize: 14, fontWeight: .w500),
                  ),
                  Image.asset(AppImages.heart, color: colorScheme.primary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
