import 'package:flutter/material.dart';

class CustomTextAppBar extends StatelessWidget {
  const CustomTextAppBar({
    super.key,
    required this.title,
    this.color = Colors.black,
    this.customSize = 0.07,
    required BuildContext context,
  });
  final String title;
  final Color color;
  final double customSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: MediaQuery.of(context).size.width * customSize,
      ),
    );
  }
}
