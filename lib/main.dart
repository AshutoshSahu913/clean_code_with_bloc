import 'package:clean_code_with_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:clean_code_with_bloc/bloc/favourite_bloc/favourite_app_bloc.dart';
import 'package:clean_code_with_bloc/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:clean_code_with_bloc/bloc/post_bloc/post_bloc.dart';
import 'package:clean_code_with_bloc/config/color/colors.dart';
import 'package:clean_code_with_bloc/config/routes/routes.dart';
import 'package:clean_code_with_bloc/config/routes/routes_name.dart';
import 'package:clean_code_with_bloc/repository/favourite_repo.dart';
import 'package:clean_code_with_bloc/repository/post_repository.dart';
import 'package:clean_code_with_bloc/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/switch_bloc/switch_bloc.dart';
import 'bloc/todo_bloc/todo_bloc.dart';

void main() {
  final postRepository = PostRepository();
  runApp(SafeArea(child: MyApp(repository: postRepository)));
}

class MyApp extends StatelessWidget {
  final PostRepository repository;

  const MyApp({super.key, required this.repository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => TodoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepo())),
        BlocProvider(create: (_) => PostBloc(repository))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.light(primary: AppColors.appColor),
        ),
        initialRoute: RoutesNames.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
