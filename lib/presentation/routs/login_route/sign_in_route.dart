import 'package:b_store/app/constants/assets.dart';
import 'package:b_store/app/constants/colors.dart';
import 'package:b_store/app/constants/routes.dart';
import 'package:b_store/domain/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class SignInRoute extends StatefulWidget {
  const SignInRoute({super.key});

  @override
  State<SignInRoute> createState() => _SignInRouteState();
}

class _SignInRouteState extends State<SignInRoute> {
  final _formKey = GlobalKey<FormState>();
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _showPassword = false;

  void _validateFields() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    setState(() {
      _isEmailValid = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$',
      ).hasMatch(email);
      _isPasswordValid = password.length >= 6;
    });
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height / 10),
            Image(image: AssetImage(AppAssets.logo), width: 80, height: 80),
            SizedBox(height: height / 9),
            Expanded(
              flex: 8,
              child: Form(
                key: _formKey,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    TextFormFieldWidget(
                      controller: _emailController,
                      prefixIcon: AppAssets.iconEmail,
                      label: local.email,
                      focusedBorderColor: AppColors.focusedBorderColor,
                      borderColor: AppColors.borderColor,
                      errorBorderColor: AppColors.errorBorderColor,
                      valid: _isEmailValid,
                      onChange: (value) => _validateFields(),
                    ),
                    SizedBox(height: 16),

                    // حقل كلمة المرور
                    TextFormFieldWidget(
                      controller: _passwordController,
                      showPassword: _showPassword,
                      suffixIcon: IconButton(
                        icon:
                            _showPassword
                                ? Image.asset(AppAssets.iconVisible)
                                : Image.asset(AppAssets.iconInvisible),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      prefixIcon: AppAssets.iconLock,
                      label: local.password,
                      focusedBorderColor: AppColors.focusedBorderColor,
                      borderColor: AppColors.borderColor,
                      errorBorderColor: AppColors.errorBorderColor,
                      valid: _isPasswordValid,
                      onChange: (value) => _validateFields(),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.forgetPassword,
                          );
                        },
                        child: Text(
                          'Forget password?',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),

                    ElevatedButton(
                      onPressed:
                          (_isEmailValid && _isPasswordValid)
                              ? () {
                                // منطق الدخول هنا
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.home,
                                );
                                print('Signing in...');
                              }
                              : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        local.login,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whaitColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.register);
              },
              child: Text(
                local.create_account,
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
