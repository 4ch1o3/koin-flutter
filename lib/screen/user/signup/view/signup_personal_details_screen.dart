import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/signup/view/gradient_container.dart';
import 'package:koin/screen/user/signup/view/terms_of_use.dart';
import 'package:koin/screen/user/signup/widget/guided_textbutton.dart';
import 'package:koin/screen/user/signup/widget/page_indicator.dart';
import 'package:koin/screen/user/signup/view/signup_security_code_screen.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final _emailController = TextEditingController();
  bool isButtonEnabled = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Widget _buildTextField({
    required String label,
    String? hintText,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: PRIMARY_COLOR,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextField(
          controller: controller,
          style: const TextStyle(color: BLACK_COLOR, fontSize: 18),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: PRIMARY_COLOR),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: PRIMARY_COLOR),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  void _onPressed() {
    {
      final email = _emailController.text;
      if (email.isEmpty || !email.contains('@')) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('올바른 이메일을 입력해주세요.')));
        return;
      }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SecurityCodeScreen(email: email),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,

      body: GradientContainer(
        hasSubmitButton: true,
        submitCallback: _onPressed,
        submitLabel: "Next",
        isSubmitEnabled: false,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 3),
            RichText(
              text: TextSpan(
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(height: 32 / 20),
                children: <TextSpan>[
                  TextSpan(text: "To start Koin,\nPlease enter "),
                  TextSpan(
                    text: "your information.",
                    style: TextStyle(color: PRIMARY_COLOR),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            _buildTextField(label: 'First name'),
            _buildTextField(label: 'Surname'),
            _buildTextField(label: 'Birthday', hintText: 'DD/MM/YYYY'),
            _buildTextField(label: 'Gender'),
            _buildTextField(label: 'Email', controller: _emailController),
            GuidedTextButton(
              nextRoute: MaterialPageRoute(
                builder: (context) => TermsOfUseScreen(),
              ),
              guideText: "Do you have any questions?",
              label: "Terms of Use",
            ),
            // const PageIndicator(length: 3, currentIndex: 0),
            // ElevatedButton(
            //   onPressed: () {
            //     final email = _emailController.text;
            //     if (email.isEmpty || !email.contains('@')) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(content: Text('올바른 이메일을 입력해주세요.')),
            //       );
            //       return;
            //     }
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => SecurityCodeScreen(email: email),
            //       ),
            //     );
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: PRIMARY_COLOR,
            //     foregroundColor: WHITE_COLOR,
            //     minimumSize: const Size(double.infinity, 52),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(26),
            //     ),
            //   ),
            //   child: const Text(
            //     'Next',
            //     style: TextStyle(
            //       fontFamily: 'Pretendard',
            //       fontSize: 18,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
