import 'package:evently/core/app_images.dart';
import 'package:evently/core/utils/validators.dart';
import 'package:evently/modules/auth/manager/auth_provider.dart';
import 'package:evently/modules/auth/screens/forget_password_screen.dart';
import 'package:evently/modules/auth/screens/singup_screen.dart';
import 'package:evently/modules/auth/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = 'login';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Consumer<AuthProvider>(
                  builder: (context, provider, child) => Column(
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
                            'Login to your account',
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
                        controller: _emailController,
                        validator: (value) => Validators.validateEmail(value),

                        hint: 'Enter your email',
                        icon: AppImages.sms,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        controller: _passwordController,
                        validator: (value) =>
                            Validators.validatePassword(value),

                        hint: 'Enter your password',
                        icon: AppImages.lock,
                        isPassword: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                ForgetPasswordScreen.id,
                              );
                            },
                            child: Text(
                              'Forget Password?',
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
                      const SizedBox(height: 40),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: .circular(16),
                          ),
                          padding: .all(12),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            provider.login(
                              email: _emailController.text,
                              password: _passwordController.text,

                              context: context,
                            );
                          }
                        },
                        child: Center(
                          child: provider.isLoading
                              ? SizedBox(
                                  height: 29,
                                  width: 29,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'Login',
                                  style: TextStyle(
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
                            'Don’t have an account ?',
                            style: TextStyle(
                              fontSize: 14,
                              color: colorScheme.secondary,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, SingupScreen.id);
                            },
                            child: Text(
                              ' Signup',
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
                      const SizedBox(height: 28),
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
                            'Or',
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
                              'Login with Google',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: .w500,
                                color: colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
