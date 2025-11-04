import 'package:clean_code_with_bloc/config/color/colors.dart';
import 'package:clean_code_with_bloc/services/splash/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    _splashServices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(onPressed: () {},
                  child: const Text(
                      style: TextStyle(color: AppColors.whiteColor),
                      'Splash screen')),
              // InternetExceptionWidget(
              //   onPress: () {
              //     // Navigator.pushNamed(context, RoutesNames.homeScreen);
              //     throw NoInternetException();
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
