import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/app_styles/app_color.dart';
import 'package:islami_app/quran/sura_content_screen.dart';
import 'package:islami_app/quran/sura_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});
  static const String routeName = 'Quran Tab';

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  Map<String, String> lastSura = {};
  @override
  void initState() {
    super.initState();
    SuraData.addSuraData();
    loadLastSura();
  }

  List<SuraData> filteredList = SuraData.suraList;
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/images/home_screen_logo.png',
            ),
          ),
          TextField(
            onChanged: (text) {
              searchText = text;
              filteredList = SuraData.suraList.where((sura) {
                return sura.suraArName.contains(searchText) ||
                    sura.suraEnName
                        .toLowerCase()
                        .contains(searchText.toLowerCase());
              }).toList();
              setState(() {});
            },
            style: const TextStyle(
                color: AppColor.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
            cursorColor: AppColor.white,
            decoration: InputDecoration(
                prefixIcon: Image.asset(
                  'assets/images/navbar_icon_quran.png',
                  color: AppColor.gold,
                ),
                hintText: 'Sura Name',
                hintStyle: const TextStyle(
                    color: Color.fromARGB(143, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColor.gold)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColor.gold))),
          ),
          searchText.isEmpty ? buildMostRecently() : SizedBox(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: const Text('Sura List',
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColor.white,
                  thickness: 2,
                  indent: 44,
                  endIndent: 44,
                );
              },
              padding: EdgeInsets.only(top: 0),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    saveLastSura(
                        suraEnName: filteredList[index].suraEnName,
                        suraArName: filteredList[index].suraArName,
                        numberOfVerses: filteredList[index].suraNumberOfVerses);
                    Navigator.of(context).pushNamed(SuraContentScreen.routeName,
                        arguments: filteredList[index]);
                  },
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/index_frame.png',
                            color: AppColor.white,
                          ),
                          Text('${filteredList[index].index}',
                              style: const TextStyle(
                                color: AppColor.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(filteredList[index].suraEnName,
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                                '${filteredList[index].suraNumberOfVerses} Verses',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      ),
                      Text(filteredList[index].suraArName,
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ),
                );
              },
              itemCount: filteredList.length,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveLastSura(
      {required String suraEnName,
      required String suraArName,
      required String numberOfVerses}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('numberOfVerses', numberOfVerses);
    loadLastSura();
  }

  Future<Map<String, String>> getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString('suraEnName') ?? '';
    String suraArName = prefs.getString('suraArName') ?? '';
    String numberOfVerses = prefs.getString('numberOfVerses') ?? '';
    return {
      'suraEnName': suraEnName,
      'suraArName': suraArName,
      'numberOfVerses': numberOfVerses
    };
  }

  void loadLastSura() async {
    lastSura = await getLastSura();
    setState(() {});
  }

  Widget buildMostRecently() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.only(top: 20),
        child: const Text('Most Recently',
            style: TextStyle(
              color: AppColor.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.gold,
        ),
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lastSura['suraEnName'] ?? '',
                    style: const TextStyle(
                      color: AppColor.darkBrown,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                Text(lastSura['suraArName'] ?? '',
                    style: TextStyle(
                      color: AppColor.darkBrown,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                Text(
                    lastSura['numberOfVerses'] == null
                        ? ''
                        : '${lastSura['numberOfVerses']} Verses',
                    style: TextStyle(
                      color: AppColor.darkBrown,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              'assets/images/most_recently_image.png',
              width: 130,
            )
          ],
        ),
      )
    ]);
  }
}
