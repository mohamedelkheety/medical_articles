import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:medical_articles/Views/home/custom_material_app.dart';
import 'package:medical_articles/business%20Logic/ad%20cubit/ad_cubit.dart';
import 'package:medical_articles/business%20Logic/app%20theme%20cubit/app_theme_cubit.dart';
import 'package:medical_articles/business%20Logic/app%20theme%20cubit/app_theme_state.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppThemeCubit()..loadTheme()

        ),
        BlocProvider(create: (context) => AdCubit()..loadInterstitialAd()),
      ],

      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return CustomMaterialApp(
            theme: state is AppDarkTheme ? ThemeData.dark() : ThemeData.light(),
          );
        },
      ),
    );
  }
}
