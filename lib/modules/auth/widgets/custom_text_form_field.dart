import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  final String hint;
  final String icon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscured = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TextFormField(
      validator: widget.validator,
      obscureText: isObscured,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                color: colorScheme.onPrimaryFixed,
                onPressed: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
                icon: Icon(
                  isObscured ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
        prefixIcon: Image.asset(widget.icon, color: colorScheme.onPrimaryFixed),
        hintText: widget.hint,
        hintStyle: TextStyle(color: colorScheme.secondary),
        fillColor: colorScheme.surface,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: .circular(16),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(16),
          borderSide: BorderSide(color: theme.dividerColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: .circular(16),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: .circular(16),
          borderSide: BorderSide(color: colorScheme.error),
        ),
      ),
    );
  }
}
