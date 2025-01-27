import 'package:flutter/material.dart';
import 'package:islami_app/app_styles/app_color.dart';

// ignore: must_be_immutable
class SuraContent extends StatelessWidget {
  String content;
  int index;
  SuraContent({required this.content, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Text('$content [${index + 1}] ',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppColor.gold,
          fontSize: 24,
          fontWeight: FontWeight.normal,
        ));
  }
}
