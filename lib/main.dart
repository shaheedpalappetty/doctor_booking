import 'package:astha_agent/src/controllers/login/login_bloc.dart';
import 'package:astha_agent/src/features/authentication/view/splash_screen.dart';
import 'package:astha_agent/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LoginBloc())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'ReadexPro',
          colorScheme: ColorScheme.fromSeed(
              seedColor: primaryColor, background: primaryColor),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
