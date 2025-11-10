import 'package:clean_code_with_bloc/config/routes/routes_name.dart';
import 'package:clean_code_with_bloc/views/counter/counter_screen.dart';
import 'package:clean_code_with_bloc/views/favourite/favourite_screen.dart';
import 'package:clean_code_with_bloc/views/image_upload/image_upload_screen.dart';
import 'package:clean_code_with_bloc/views/post/post_screen.dart';
import 'package:flutter/material.dart';

import '../../views/todo/todo_screen.dart';
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
      case RoutesNames.imageUploadScreen:
        return MaterialPageRoute(builder: (context) => ImageUploadScreen());
      case RoutesNames.todoScreen:
        return MaterialPageRoute(builder: (context) => TodoScreen());
      case RoutesNames.favouriteScreen:
        return MaterialPageRoute(builder: (context) => FavouriteScreen());
      case RoutesNames.postScreen:
        return MaterialPageRoute(builder: (context)=> PostScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text('No Destination Found!'))),
        );
    }
  }
}
