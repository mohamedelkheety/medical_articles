import 'package:flutter/material.dart';
import 'package:medical_articles/Views/home/home_page.dart';
import 'package:medical_articles/helper/media_query_size.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    super.key,
    this.fit,
    required this.assetName,
    required this.text,
    this.paddingSize = 8,
    this.marginSize = 8,
  });
  final BoxFit? fit;
  final double paddingSize, marginSize;
  final String assetName, text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingSize),
      margin: EdgeInsets.all(4),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.black,

        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          opacity: 0.6,
          image: AssetImage(assetName),
          fit: BoxFit.fill,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,

        child: Text(
          text,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: Colors.white,
            fontSize: getResponsiveWidth(
              context,
              mobileWidth: 0.048,
              tabletWidth: 16,
            ),
          ),
        ),
      ),
    );
  }
}
