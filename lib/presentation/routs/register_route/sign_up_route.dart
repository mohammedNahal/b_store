import 'package:b_store/app/constants/assets.dart';
import 'package:b_store/app/constants/colors.dart';
import 'package:b_store/app/constants/routes.dart';
import 'package:flutter/material.dart';

import '../../../domain/widgets/text_form_field_widget.dart';
import '../../../generated/l10n.dart';

class SignUpRoute extends StatefulWidget {
  const SignUpRoute({super.key});

  @override
  State<SignUpRoute> createState() => _SignUpRouteState();
}

class _SignUpRouteState extends State<SignUpRoute> {
  final _formKey = GlobalKey<FormState>();
  bool _isEmailValid = false;
  bool _isMobileValid = false;
  bool _isPasswordValid = false;
  bool _showPassword = false;

  void _validateFields() {
    final email = _emailController.text.trim();
    final mobile = _mobileController.text.trim();
    final password = _passwordController.text.trim();

    setState(() {
      _isEmailValid = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$',
      ).hasMatch(email);
      _isMobileValid = mobile.length == 10 && mobile.startsWith('05');
      _isPasswordValid = password.length >= 6;
    });
  }

  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final local = S.of(context);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height/10,
            ),
            Image(image: AssetImage(AppAssets.logo), width: 80, height: 80),
            SizedBox(
              height: height/9,
            ),
            Expanded(
              flex: 8,
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
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
                    TextFormFieldWidget(
                      controller: _mobileController,
                      prefixIcon: AppAssets.iconPhone,
                      label: local.mobile,
                      focusedBorderColor: AppColors.focusedBorderColor,
                      borderColor: AppColors.borderColor,
                      errorBorderColor: AppColors.errorBorderColor,
                      valid: _isMobileValid,
                      onChange: (value) => _validateFields(),
                    ),
                    SizedBox(height: 16),
                    TextFormFieldWidget(
                      controller: _passwordController,
                      showPassword: _showPassword,
                      suffixIcon: IconButton(
                        icon: _showPassword ? Image.asset(AppAssets.iconVisible):Image.asset(AppAssets.iconInvisible),
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
                    SizedBox(
                      height: height/17,
                    ),
                    ElevatedButton(
                      onPressed:
                      (_isEmailValid && _isMobileValid && _isPasswordValid)
                          ? () {
                        // منطق إنشاء الحساب هنا
                        print('Creating account...');
                      }
                          : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, MediaQuery.of(context).size.height/13),
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        local.create_account,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
              child: Text(
                local.have_account,
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField textFormFieldWidget(S local) {
    return TextFormField(
                    controller: _passwordController,
                    obscureText: !_showPassword,
                    decoration:InputDecoration(
                      prefixIcon: Container(
                        padding: EdgeInsets.all(12.0),
                        child: Image.asset(
                          AppAssets.iconLock,
                          width: 25,
                          height: 25,
                          fit: BoxFit.contain,
                        ),
                      ),
                      labelText: local.password,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: AppColors.focusedBorderColor,
                            width: 1,
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: AppColors.borderColor,
                            width: 1,
                          )
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: AppColors.errorBorderColor,
                            width: 1,
                          )
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: _isEmailValid ? AppColors.focusedBorderColor : AppColors.errorBorderColor,
                            width: 1,
                          )
                      ),
                      suffixIcon: IconButton(
                        icon: Container(
                          padding: EdgeInsets.all(8.0),
                          child : _showPassword ? Image.asset(AppAssets.iconInvisible,width: 25,height: 25,) : Image.asset(AppAssets.iconVisible,width: 25,height: 25),
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                    onChanged: (value) => _validateFields(),
                  );
  }
}
