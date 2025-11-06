import 'package:clean_code_with_bloc/config/routes/routes_name.dart';
import 'package:clean_code_with_bloc/views/counter/counter_screen.dart';
import 'package:flutter/material.dart';

import '../../views/view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RoutesNames.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesNames.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RoutesNames.counterScreen:
        return MaterialPageRoute(builder: (context) => CounterScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('No Destination Found!'))),
        );
    }
  }
}
