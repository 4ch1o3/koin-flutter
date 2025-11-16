import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/home_screen.dart';
import 'package:koin/screen/user/signup/view/gradient_container.dart';
import 'package:koin/screen/user/signup/view/signup_reset_password_screen.dart';
import 'package:koin/screen/user/signup/widget/guided_textbutton.dart';
import 'package:koin/screen/user/signup/widget/submit_button.dart';

class LoginEmailScreen extends StatefulWidget {
  const LoginEmailScreen({super.key});

  @override
  State<LoginEmailScreen> createState() => _LoginEmailScreenState();
}

class _LoginEmailScreenState extends State<LoginEmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateState);
    _passwordController.addListener(_updateState);
  }

  void _updateState() {
    setState(() {});
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateState);
    _passwordController.removeListener(_updateState);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signIn() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isButtonEnabled =
        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: TRANSPARENT_COLOR,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: GradientContainer(
        hasSubmitButton: true,
        submitCallback: _signIn,
        submitLabel: "Login",
        isSubmitEnabled: isButtonEnabled,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // LOGO AREA
            const Spacer(flex: 8),
            Column(
              spacing: 32,
              children: [
                Image.asset('asset/img/icon/logo.png', width: 168),
                Text(
                  'Koin',
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge?.copyWith(color: PRIMARY_COLOR),
                ),
              ],
            ),
            const Spacer(flex: 3),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: BLACK_COLOR,
              style: const TextStyle(color: BLACK_COLOR),
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                floatingLabelStyle: TextStyle(color: PRIMARY_COLOR),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: GRAY_COLOR),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: PRIMARY_COLOR, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              cursorColor: BLACK_COLOR,
              style: const TextStyle(color: BLACK_COLOR),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(
                  color: PRIMARY_COLOR,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                floatingLabelStyle: const TextStyle(color: PRIMARY_COLOR),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: GRAY_COLOR),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: PRIMARY_COLOR, width: 2),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: GRAY_COLOR,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const Spacer(flex: 2),
            GuidedTextButton(
              nextRoute: MaterialPageRoute(
                builder: (context) => const ResetPasswordScreen(),
              ),
              guideText: "Forget your account?",
              label: "Find My Account",
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
