import 'package:flutter/material.dart';
import 'package:islami_app/app_styles/app_color.dart';
import 'package:islami_app/hadeth/hadeth_content.dart';
import 'package:islami_app/hadeth/hadeth_data.dart';

class HadethContentScreen extends StatefulWidget {
  static const String routeName = 'Hadeth Content Screen';
  const HadethContentScreen({super.key});

  @override
  State<HadethContentScreen> createState() => _HadethContentScreenState();
}

class _HadethContentScreenState extends State<HadethContentScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethData;
    // if (verses.isEmpty) {
    //   loadFile(args.index);
    // }
    return Scaffold(
      backgroundColor: AppColor.darkBrown,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.gold),
        backgroundColor: AppColor.transparent,
        centerTitle: true,
        title: Text('Hadeth ${args.index}',
            style: const TextStyle(
              color: AppColor.gold,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/frame_left.png'),
              Text(args.title,
                  style: const TextStyle(
                    color: AppColor.gold,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              Image.asset('assets/images/frame_right.png'),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (context, index) {
                return HadethContent(
                  content: args.content,
                );
              },
              itemCount: 1,
            ),
          ),
          Image.asset("assets/images/quran_bottom_bg.png"),
        ],
      ),
    );
  }

  // void loadFile(int index) async {
  //   String suraContent =
  //       await rootBundle.loadString('assets/files/suras/$index.txt');
  //   List<String> suraVersesList = suraContent.split('\n');
  //   verses = suraVersesList;
  //   setState(() {});
  // }
}
