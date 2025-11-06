import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonTxt;
  final VoidCallback onPressed;

  const RoundedButtonWidget({
    super.key,
    required this.buttonTxt,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(buttonTxt));
  }
}
