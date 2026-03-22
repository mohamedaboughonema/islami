import 'package:flutter/material.dart';
import 'package:islami_app/app_styles/app_color.dart';
import 'package:islami_app/app_styles/app_text_styles.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});
  static const String routeName = 'Time Tab';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/home_screen_logo.png',
        ),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColor.grey, borderRadius: BorderRadius.circular(40)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '19 jul\n 2025',
                    style: AppTextStyle.bold16white,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    'pray time\n Wednedday',
                    style: AppTextStyle.bold16DarkGold,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '02 muh\n 1446',
                    style: AppTextStyle.bold16white,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
              SizedBox(
                height: 200,
              )
            ],
          ),
        )
      ],
    );
  }
}
