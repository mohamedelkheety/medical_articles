import 'package:flutter/material.dart';
import 'package:medical_articles/helper/media_query_size.dart';

getResponsiveWidth(
  BuildContext context, {
  required double mobileWidth,
  required double tabletWidth,
}) {
  if (MediaQuerySize.width(context) > 400) {
    return tabletWidth;
  } else {
    return MediaQuerySize.width(context) * mobileWidth;
  }
}
