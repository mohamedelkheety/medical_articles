import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medical_articles/business%20Logic/app_theme_state.dart';
import 'package:medical_articles/models/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppInitialTheme());
  static SharedPreferences? sharedPreferences;
  void changeTheme(ThemeState? themState) {
    try {
      switch (themState!) {
        case ThemeState.initial:
          break;

        case ThemeState.light:
          sharedPreferences!.setString('theme', 'light');
          emit(AppLightTheme());
          break;
        case ThemeState.dark:
          sharedPreferences!.setString('theme', 'drak');

          emit(AppDarkTheme());
          break;
      }
    } catch (e) {
      debugPrint('Error in changeTheme $e');
    }
  }
}
