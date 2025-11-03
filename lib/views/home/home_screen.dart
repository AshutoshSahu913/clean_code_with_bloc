import 'package:clean_code_with_bloc/config/componets/round_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LoadingWidget(),
              Text("Home Screen"),
              RoundButton(title: 'Login', onPress: () {}),
              RoundButton(title: 'Sign Up', onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
