import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_articles/Views/about_us/developer.dart';
import 'package:medical_articles/Views/home/home_page.dart';
import 'package:medical_articles/business%20Logic/app%20theme%20cubit/app_theme_cubit.dart';
import 'package:medical_articles/helper/get_responsive_width.dart';
import 'package:medical_articles/helper/media_query_size.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: getResponsiveWidth(context, mobileWidth: 0.6, tabletWidth: 250),
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/images/luncher_icon.png',
              height: MediaQuerySize.width(context) * .045,
            ),
          ),
          ListTile(
            title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.home),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false,
              );
            },
          ),
          ListTile(
            // horizontalTitleGap: 100,
            title: Text('Theme', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Icon(Icons.light_mode),
            onTap: () {
              BlocProvider.of<AppThemeCubit>(context).changeTheme();
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: Text(
              'About us',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.developer_mode_sharp),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Developer()));
            },
          ),
        ],
      ),
    );
  }
}
