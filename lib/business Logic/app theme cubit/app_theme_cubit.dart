import 'package:bloc/bloc.dart';
import 'package:medical_articles/business%20Logic/app%20theme%20cubit/app_theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppLightTheme());
  static SharedPreferences? sharedPreferences;
   Future<void> loadTheme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? theme = sharedPreferences!.getString('theme');

    if (theme == 'dark') {
      emit(AppDarkTheme());
    } else {
      emit(AppLightTheme());
    }
  }
  
   
       void changeTheme() {
    if (state is AppDarkTheme) {
      sharedPreferences?.setString('theme', 'light');
      emit(AppLightTheme());
    } else {
      sharedPreferences?.setString('theme', 'dark');
      emit(AppDarkTheme());
    }
  }
}
   
  

