import 'package:flutter/material.dart';
import 'package:islami_app/app_styles/app_color.dart';

// ignore: must_be_immutable
class HadethContent extends StatelessWidget {
  String content;
  HadethContent({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(content,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColor.gold,
          fontSize: 24,
          fontWeight: FontWeight.normal,
        ));
  }
}
