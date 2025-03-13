import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:medical_articles/Views/splashView/splash_view.dart';
import 'package:medical_articles/business%20Logic/app_theme_cubit.dart';
import 'package:medical_articles/business%20Logic/app_theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  AppThemeCubit.sharedPreferences = await SharedPreferences.getInstance();
   
  AppThemeCubit appThemeCubit = AppThemeCubit();
  await appThemeCubit.loadTheme();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
AppThemeCubit cubit = AppThemeCubit();
        cubit.loadTheme();

        return cubit;
      } ,
        
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
         
          return CustomMaterialApp(theme:  state is AppDarkTheme ? ThemeData.dark() : ThemeData.light(),
          );
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
