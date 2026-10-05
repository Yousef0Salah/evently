import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectedWidget extends StatelessWidget {
  SelectedWidget({super.key, required this.title, this.isSelected = true, required this.onPressed});
  SelectedWidget.icon({required this.icon, this.isSelected = true, required this.onPressed});

  String? title;
  String? icon;
  final bool isSelected;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected
            ? colorScheme.onPrimary
            : colorScheme.onSurface,

        backgroundColor: isSelected ? colorScheme.primary : colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: .circular(8)),
        side: BorderSide(color: colorScheme.outline),
      ),
      onPressed: onPressed,
      child: icon == null
          ? Text(title!)
          : ImageIcon(AssetImage(icon!), size: 24),
    );
  }
}
