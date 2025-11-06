import 'package:clean_code_with_bloc/bloc/counter_bloc/counter_bloc.dart';
import 'package:clean_code_with_bloc/config/color/colors.dart';
import 'package:clean_code_with_bloc/config/routes/routes.dart';
import 'package:clean_code_with_bloc/config/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/switch_bloc/switch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
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
