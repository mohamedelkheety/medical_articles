import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_articles/Views/splashView/splash_view.dart';
import 'package:medical_articles/business%20Logic/app_theme_cubit.dart';
import 'package:medical_articles/business%20Logic/app_theme_state.dart';
import 'package:medical_articles/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppThemeCubit.sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppThemeCubit(),
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          if (state is AppDarkTheme) {
            return CustomMaterialApp(theme: ThemeData.dark());
          } else if (state is AppLightTheme) {
            return CustomMaterialApp(theme: ThemeData.light());
          }
          return CustomMaterialApp(theme: ThemeData.light());
        },
      ),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({super.key, required this.theme});
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        textTheme: theme.textTheme.apply(fontFamily: 'ElMessiri'),
      ),
      home: const SplashView(),
    );
  }
}
