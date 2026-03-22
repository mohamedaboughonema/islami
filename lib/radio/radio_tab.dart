import 'package:flutter/material.dart';
import 'package:islami_app/api_manager/api_manager_radio.dart';
import 'package:islami_app/api_manager/api_manager_reciter.dart';
import 'package:islami_app/app_styles/app_color.dart';
import 'package:islami_app/radio/radio_response.dart';
import 'package:islami_app/radio/radio_widget.dart';
import 'package:islami_app/radio/reciter_response.dart';
import 'package:islami_app/radio/reciter_widget.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});
  static const String routeName = 'Radio Tab';

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // List<String> radioTabList = ['Radio','Reciters'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          'assets/images/home_screen_logo.png',
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.darkBrown.withOpacity(0.5),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    selectedIndex = 0;
                    setState(() {});
                  },
                  child: TabTitle(
                      title: 'Radio',
                      selectedIndex: selectedIndex,
                      currentIndex: 0),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    selectedIndex = 1;
                    setState(() {});
                  },
                  child: TabTitle(
                      title: 'Reciters',
                      selectedIndex: selectedIndex,
                      currentIndex: 1),
                ),
              ),
            ],
          ),
        ),
        selectedIndex == 0
            ? FutureBuilder<RadioResponse>(
                future: ApiManagerRadio.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                        child: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.gold,
                      ),
                    ));
                  } else if (snapshot.hasError) {
                    return Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Something went wrong',
                            style:
                                TextStyle(color: AppColor.gold, fontSize: 20),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text(
                              'Try Again',
                              style: TextStyle(
                                  color: AppColor.white, fontSize: 20),
                            ))
                      ],
                    ));
                  }
                  return Expanded(
                      child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      return RadioWidget(
                          model: snapshot.data!.radios![index],
                          title: snapshot.data!.radios![index].name ??
                              'No Radios Found');
                    },
                    itemCount: snapshot.data!.radios!.length,
                  ));
                })
            : selectedIndex == 1
                ? FutureBuilder<ReciterResponse>(
                    future: ApiManagerReciter.getData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Expanded(
                            child: Center(
                          child: CircularProgressIndicator(
                            color: AppColor.gold,
                          ),
                        ));
                      } else if (snapshot.hasError) {
                        return Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'Something went wrong',
                                style: TextStyle(
                                    color: AppColor.gold, fontSize: 20),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                child: Text(
                                  'Try Again',
                                  style: TextStyle(
                                      color: AppColor.white, fontSize: 20),
                                ))
                          ],
                        ));
                      }
                      return Expanded(
                          child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        itemBuilder: (context, index) {
                          return ReciterWidget(
                              model: snapshot.data!.reciters![index],
                              title: snapshot.data!.reciters![index].name ??
                                  'No Reciter Found');
                        },
                        itemCount: snapshot.data!.reciters!.length,
                      ));
                    })
                : SizedBox(),
      ],
    );
  }
}

class TabTitle extends StatelessWidget {
  const TabTitle(
      {required this.title,
      required this.selectedIndex,
      required this.currentIndex,
      super.key});
  final int selectedIndex;
  final int currentIndex;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: selectedIndex == currentIndex
            ? AppColor.gold
            : AppColor.transparent,
      ),
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: selectedIndex == currentIndex
                ? AppColor.darkBrown
                : AppColor.white),
      ),
    );
  }
}
