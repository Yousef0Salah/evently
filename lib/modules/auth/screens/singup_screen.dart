import 'package:evently/core/app_images.dart';
import 'package:evently/core/utils/validators.dart';
import 'package:evently/l10n/app_localizations.dart'; // adjust to your generated path
import 'package:evently/modules/auth/manager/auth_provider.dart';
import 'package:evently/modules/auth/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});
  static const String id = 'singup';
  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;

    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Consumer<AuthProvider>(
                builder: (context, provider, child) {
                  return Form(
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    key: _formKey,
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            AppImages.evently,
                            width: 142,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 48),
                        Row(
                          children: [
                            Text(
                              l10n.createYourAccount,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: .w600,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        CustomTextFormField(
                          controller: _nameController,
                          validator: (value) => Validators.validateName(value),
                          hint: l10n.enterYourName,
                          icon: AppImages.user,
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          controller: _emailController,
                          validator: (value) => Validators.validateEmail(value),
                          hint: l10n.enterYourEmail,
                          icon: AppImages.sms,
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          controller: _passwordController,
                          validator: (value) =>
                              Validators.validatePassword(value),
                          hint: l10n.enterYourPassword,
                          icon: AppImages.lock,
                          isPassword: true,
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          controller: _confirmPasswordController,
                          validator: (value) =>
                              Validators.validateConfirmPassword(
                                value,
                                _passwordController.text,
                              ),
                          hint: l10n.confirmYourPassword,
                          icon: AppImages.lock,
                          isPassword: true,
                        ),
                        const SizedBox(height: 48),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: .circular(16),
                            ),
                            padding: .all(12),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              provider.createAccount(
                                email: _emailController.text,
                                password: _passwordController.text,
                                name: _nameController.text,
                                context: context,
                              );
                            }
                          },
                          child: Center(
                            child: provider.isLoading
                                ? const SizedBox(
                                    height: 29,
                                    width: 29,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    l10n.signUp,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: .w500,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 48),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l10n.alreadyHaveAccount,
                              style: TextStyle(
                                fontSize: 14,
                                color: colorScheme.secondary,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                l10n.login,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: .w600,
                                  color: colorScheme.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor: colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: theme.dividerColor,
                                endIndent: 10,
                                indent: 10,
                              ),
                            ),
                            Text(
                              l10n.or,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: .w500,
                                color: colorScheme.primary,
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: theme.dividerColor,
                                endIndent: 10,
                                indent: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: colorScheme.surface,
                            foregroundColor: colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: .circular(16),
                              side: BorderSide(color: theme.dividerColor),
                            ),
                            padding: .all(12),
                          ),
                          onPressed: () {
                            provider.signInWithGoogle(context: context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.google),
                              const SizedBox(width: 16),
                              Text(
                                l10n.signUpWithGoogle,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: .w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}