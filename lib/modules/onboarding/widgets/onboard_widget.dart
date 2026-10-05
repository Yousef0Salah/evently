import 'package:evently/modules/onboarding/model/onbord_model.dart';
import 'package:flutter/material.dart';

class OnboardWidget extends StatelessWidget {
  const OnboardWidget({
    super.key,
    required this.onboard,
    required this.length,
    required this.currentPageIndex,
  });

  final OnboardModel onboard;
  final int length;
  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Image.asset(onboard.image, color: colorScheme.onSurface)),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(length, (index) {
            bool isSelect = currentPageIndex == index;
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: isSelect ? 21 : 7,
              height: 7,
              margin: .all(3),
              decoration: BoxDecoration(
                color: isSelect
                    ? colorScheme.primary
                    : colorScheme.onPrimaryFixed,
                borderRadius: BorderRadius.circular(50),
              ),
            );
          }),
        ),
        const SizedBox(height: 12),
        Text(onboard.title, style: theme.textTheme.titleLarge),
        const SizedBox(height: 8),

        Text(onboard.subTitle, style: theme.textTheme.bodyMedium),
      ],
    );
  }
}
