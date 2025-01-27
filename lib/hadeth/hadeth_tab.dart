import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_styles/app_color.dart';
import 'package:islami_app/hadeth/hadeth_content_screen.dart';
import 'package:islami_app/hadeth/hadeth_data.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});
  static const String routeName = 'Hadeth Tab';

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/images/home_screen_logo.png',
          ),
        ),
        hadethList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: AppColor.gold,
              ))
            : CarouselSlider.builder(
                itemCount: hadethList.length,
                itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) =>
                    InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                          HadethContentScreen.routeName,
                          arguments: HadethData(
                              index: hadethList[itemIndex].index,
                              title: hadethList[itemIndex].title,
                              content: hadethList[itemIndex].content)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.gold,
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/hadith_card_background.png')),
                            borderRadius: BorderRadius.circular(25)),
                        child: Expanded(
                          child: Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Stack(children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                            "assets/images/hadeth_frame_left.png"),
                                        Spacer(),
                                        Image.asset(
                                            "assets/images/hadeth_frame_right.png")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 40),
                                    alignment: Alignment.center,
                                    child: Text(hadethList[itemIndex].title,
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(
                                          color: AppColor.darkBrown,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ]),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 0),
                                    child: Text(hadethList[itemIndex].content,
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(
                                          color: AppColor.darkBrown,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/hadeth_bottom_bg.png",
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                options: CarouselOptions(
                  height: 500,
                  // aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  // autoPlayInterval: Duration(seconds: 3),
                  // autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  // onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ))
      ],
    );
  }

  List<HadethData> hadethList = [];
  loadHadethFile() async {
    for (int i = 0; i < 50; i++) {
      String hadethContent =
          await rootBundle.loadString('assets/files/hadeeth/h${i + 1}.txt');
      List<String> hadethLines = hadethContent.split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      String content = hadethLines.join('');
      hadethList.add(HadethData(index: i + 1, title: title, content: content));
    }
    setState(() {});
  }
}
