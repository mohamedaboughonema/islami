import 'package:flutter/material.dart';
import 'package:islami_app/app_styles/app_color.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});
  static const String routeName = 'Sebha Tab';

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double rotationAngle = 0;

  int index = 0;
  int counter = 0;
  List<String> tasbeehWords = ['سبحان الله', 'الحمدلله', 'الله أكبر'];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Image.asset(
        'assets/images/home_screen_logo.png',
      ),
          const Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى",
          textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.white,
                fontSize: 36,
                fontWeight: FontWeight.w700,
              )),
      Stack(children: [
        Positioned(
          left: width * 0.48,
          child: Image.asset(
            'assets/images/sebha_head.png',
            height: height * 0.1,
          ),
        ),
        InkWell(
          onTap: () {
            rotationAngle += 12;
            counter++;
            if(counter > 33){
              index = (index + 1) % tasbeehWords.length;
            counter = 0;
            }
            setState(() {
              
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: height * 0.095),
            child: Stack(
              children: [Center(
                child: AnimatedRotation(
                  turns: rotationAngle / 360,
                  duration: Duration(milliseconds: 250),
                  child: Image.asset(
                    'assets/images/sebha_body.png',
                    height: height * 0.4,
                  ),
                ),
              ),
              Container(
                height: height * 0.4,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Spacer(),
                  Text(tasbeehWords[index],
                          textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  )),
                  SizedBox(height: height * 0.03,),
                  Text(counter.toString(),
                          textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  )),
                    Spacer(),
                ],),
              )
              ]
            ),
          ),
        ),
      ],)
    ],);
  }
}
