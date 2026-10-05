import 'package:flutter/material.dart';

class CustomeLargeButton extends StatelessWidget {
  const CustomeLargeButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: .circular(16)),
        padding: .all(12),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: .w500,
          ),
        ),
      ),
    );
  }
}
