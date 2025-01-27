import 'package:flutter/material.dart';
import 'package:islami_app/app_styles/app_color.dart';
import 'package:islami_app/hadeth/hadeth_tab.dart';
import 'package:islami_app/quran/quran_tab.dart';
import 'package:islami_app/radio/radio_tab.dart';
import 'package:islami_app/sebha/sebha_Tab.dart';
import 'package:islami_app/time/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> screenBackgroundPathList = [
    'assets/images/quran_screen_background.png',
    'assets/images/hadeth_screen_background.png',
    'assets/images/sebha_screen_background.png',
    'assets/images/radio_screen_background.png',
    'assets/images/time_screen_background.png'
  ];
  List<Widget> tabs = [
    QuranTab(),
    const HadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          screenBackgroundPathList[selectedIndex],
          fit: BoxFit.cover,
          height: double.infinity,
        ),
        Scaffold(
          // backgroundColor: AppColor.transparent,          // adjusted in app_theme.dart
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: AppColor.gold),
            child: BottomNavigationBar(
                // backgroundColor: AppColor.gold,           // adjusted with canvasColor
                // type: BottomNavigationBarType.fixed,      // adjusted with canvasColor
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                items: [
                  BottomNavigationBarItem(
                      icon: selectedTap(
                          index: 0,
                          imagePath: 'assets/images/navbar_icon_quran.png'),
                      label: 'Quran'),
                  BottomNavigationBarItem(
                      icon: selectedTap(
                          index: 1,
                          imagePath: 'assets/images/navbar_icon_hadeth.png'),
                      label: 'Hadeth'),
                  BottomNavigationBarItem(
                      icon: selectedTap(
                          index: 2,
                          imagePath: 'assets/images/navbar_icon_sebha.png'),
                      label: 'Sebha'),
                  BottomNavigationBarItem(
                      icon: selectedTap(
                          index: 3,
                          imagePath: 'assets/images/navbar_icon_radio.png'),
                      label: 'Radio'),
                  BottomNavigationBarItem(
                      icon: selectedTap(
                          index: 4,
                          imagePath: 'assets/images/navbar_icon_time.png'),
                      label: 'Time'),
                ]),
          ),
          body: tabs[selectedIndex],
        )
      ],
    );
  }

  Widget selectedTap({required int index, required String imagePath}) {
    return selectedIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColor.grey.withOpacity(0.6)),
            child: ImageIcon(AssetImage(imagePath)),
          )
        : ImageIcon(AssetImage(imagePath));
  }
}
