import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputEmailWidget(emailFocusNode: emailFocusNode),
              SizedBox(height: 20),
              InputPasswordWidget(passwordFocusNode: passwordFocusNode),
              SizedBox(height: 20),
              LoginButtonWidget(
                title: "Login",
                onPress: () {
                  if (_formKey.currentState!.validate()) {
                    print("i am Here ");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
