import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_styles/app_color.dart';
import 'package:islami_app/quran/sura_content.dart';
import 'package:islami_app/quran/sura_data.dart';

class SuraContentScreen extends StatefulWidget {
  static const String routeName = 'Sura Content Screen';
  const SuraContentScreen({super.key});

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraData;
    if (verses.isEmpty) {
      loadFile(args.fileName);
    }
    return Scaffold(
      backgroundColor: AppColor.darkBrown,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.gold),
        backgroundColor: AppColor.transparent,
        centerTitle: true,
        title: Text(args.suraEnName,
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
              Text(args.suraArName,
                  style: const TextStyle(
                    color: AppColor.gold,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              Image.asset('assets/images/frame_right.png'),
            ],
          ),
          Expanded(
            child: verses.isEmpty
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColor.gold,
                  ))
                : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) {
                      return SuraContent(
                        content: verses[index],
                        index: index,
                      );
                    },
                    itemCount: verses.length,
                  ),
          ),
          Image.asset("assets/images/quran_bottom_bg.png"),
        ],
      ),
    );
  }

  void loadFile(String fileName) async {
    String suraContent =
        await rootBundle.loadString('assets/files/suras/$fileName');
    List<String> suraVersesList = suraContent.split('\n');
    verses = suraVersesList;
    setState(() {});
  }
}
