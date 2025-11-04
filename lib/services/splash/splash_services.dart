import 'dart:async';

import 'package:clean_code_with_bloc/config/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';

class SplashServices {

  void isLogin(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesNames.loginScreen, (route) => false);
    });
  }
}