import 'package:flutter/material.dart';

import '../../config/componets/internet_exception_widget.dart';
import '../../data/exception/app_exceptions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: const Text('Splash screen')),
              InternetExceptionWidget(
                onPress: () {
                  // Navigator.pushNamed(context, RoutesNames.homeScreen);
                  throw NoInternetException();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
