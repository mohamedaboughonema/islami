import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_styles/app_theme.dart';
import 'package:islami_app/hadeth/hadeth_content_screen.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/on_boarding_screen.dart';
import 'package:islami_app/quran/sura_content_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        SuraContentScreen.routeName: (context) => SuraContentScreen(),
        HadethContentScreen.routeName: (context) => HadethContentScreen(),
      },
    );
  }
}
