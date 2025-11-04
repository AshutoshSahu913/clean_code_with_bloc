import 'package:flutter/material.dart';

class InputPasswordWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;

  const InputPasswordWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      keyboardAppearance: Brightness.light,
      focusNode: passwordFocusNode,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: "Enter Password",
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {},
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Password';
        }
        return null;
      },
      onFieldSubmitted: (value) {},
    );
  }
}
