import 'package:evently/core/app_images.dart';
import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/core/utils/validators.dart';
import 'package:evently/modules/auth/manager/auth_provider.dart';
import 'package:evently/modules/auth/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  static const String id = 'forgetPassword';

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var provider = Provider.of<AppProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          leading: FittedBox(
            fit: BoxFit.scaleDown,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
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
          title: Text('Forget Password', style: theme.textTheme.titleLarge),
          centerTitle: true,
          elevation: 0,
        ),
        body: Consumer<AuthProvider>(
          builder: (context, provider, child) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(
                  AppImages.resetPassword,
                  color: colorScheme.onSurface,
                ),
                const SizedBox(height: 40),
                CustomTextFormField(
                  controller: _emailController,
                  validator: (value) => Validators.validateEmail(value),

                  hint: 'Enter your email',
                  icon: AppImages.sms,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: .circular(16)),
                    padding: .all(12),
                  ),
                  onPressed: () {
                    provider.resetPassword(
                      email: _emailController.text,
                      context: context,
                    );
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
                            'Reset password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: .w500,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
