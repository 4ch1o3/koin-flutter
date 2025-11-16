import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

enum InputType { email, password, common }

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.inputTextController,
    required this.labelText,
    required this.type,
  });

  final TextEditingController inputTextController;
  final String labelText;
  final InputType type;

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
    return TextField(
      controller: widget.inputTextController,

      keyboardType: TextInputType.emailAddress,
      cursorColor: BLACK_COLOR,
      // TODO: apply new style?
      style: const TextStyle(color: BLACK_COLOR),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: PRIMARY_COLOR,
        ),

        floatingLabelStyle: TextStyle(color: PRIMARY_COLOR),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: GRAY_COLOR),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: PRIMARY_COLOR, width: 2),
        ),
      ),
    );
  }
}
