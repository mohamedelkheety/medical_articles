import 'package:flutter/material.dart';
import 'package:medical_articles/Views/splashView/splash_view.dart';

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
