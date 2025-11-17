import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

enum InputType { email, password, common }

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.inputTextController,
    required this.labelText,
    required this.type,
    this.isEmailValid,
    this.showPassword,
    this.isPasswordValid,
    this.hintText,
  });

  final TextEditingController inputTextController;
  final String labelText;
  final InputType type;
  final String? hintText;
  final bool? isEmailValid;
  final bool? showPassword;
  final bool? isPasswordValid;

  @override
  State<StatefulWidget> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  void initState() {
    super.initState();
  }

  // TODO: if input type is email, add email validation

  @override
  Widget build(BuildContext context) {
    assert(
      !(widget.type == InputType.email && widget.isEmailValid == null) ||
          !(widget.type == InputType.password &&
              widget.isPasswordValid == null &&
              widget.showPassword == null),
    );

    TextInputType keyboardType;

    if (widget.type == InputType.email) {
      keyboardType = TextInputType.emailAddress;
    } else if (widget.type == InputType.password) {
      keyboardType = TextInputType.visiblePassword;
    } else {
      keyboardType = TextInputType.text;
    }

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: PRIMARY_COLOR,
            ),
          ),
          TextField(
            controller: widget.inputTextController,
            obscureText: (widget.type == InputType.password ? true : false),

            keyboardType: keyboardType,
            cursorColor: GrayScale.black,
            // TODO: apply new style?
            style: const TextStyle(color: GrayScale.black),
            decoration: InputDecoration(
              hintText: (widget.hintText),
              hintStyle: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: GrayScale.gray400),
              // labelText: widget.labelText,
              // labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              //   fontWeight: FontWeight.w500,
              //   color: PRIMARY_COLOR,
              // ),

              // floatingLabelStyle: TextStyle(color: PRIMARY_COLOR),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PRIMARY_COLOR),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PRIMARY_COLOR, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
