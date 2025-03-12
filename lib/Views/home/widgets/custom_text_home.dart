import 'package:flutter/material.dart';
import 'package:medical_articles/helper/get_responsive_width.dart';

class CustomTextHome extends StatelessWidget {
  const CustomTextHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,

      child: Text(
        "جميع المقالات",
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: getResponsiveWidth(
            context,
            mobileWidth: 0.05,
            tabletWidth: 20,
          ),
        ),
      ),
    );
  }
}
