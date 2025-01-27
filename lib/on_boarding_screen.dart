import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/app_styles/app_color.dart';
import 'package:islami_app/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static const String routeName = 'OnBoardingScreen';

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 300]) {
    return Image.asset(assetName, width: width);
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 24.0, fontWeight: FontWeight.bold, color: AppColor.gold),
      bodyTextStyle: TextStyle(
          fontSize: 20, color: AppColor.gold, fontWeight: FontWeight.bold),
      bodyPadding: EdgeInsets.all(10),
      pageColor: AppColor.darkBrown,
      imagePadding: EdgeInsets.zero,
      bodyFlex: 3,
      imageFlex: 9,
      bodyAlignment: Alignment.center,
      imageAlignment: Alignment.bottomCenter,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColor.darkBrown,
      allowImplicitScrolling: true,
      autoScrollDuration: 20000,
      // infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 0, right: 0),
            child: _buildImage('assets/images/home_screen_logo.png', 300),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "",
          image: _buildImage('assets/images/intro_screen_1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage('assets/images/intro_screen_2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage('assets/images/intro_screen_3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
            title: "Bearish",
            body: "Praise the name of your Lord, the Most High",
            image: _buildImage('assets/images/intro_screen_4.png'),
            decoration: pageDecoration),
        PageViewModel(
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          decoration: pageDecoration,
          image: _buildImage('assets/images/intro_screen_5.png', 300),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Text('Back',
          style: TextStyle(fontWeight: FontWeight.w600, color: AppColor.gold)),
      skip: const Text('Skip',
          style: TextStyle(fontWeight: FontWeight.w600, color: AppColor.gold)),
      next: const Text('Next',
          style: TextStyle(fontWeight: FontWeight.w600, color: AppColor.gold)),
      done: const Text('Finish',
          style: TextStyle(fontWeight: FontWeight.w600, color: AppColor.gold)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(0),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: AppColor.grey,
        activeSize: Size(22.0, 10.0),
        activeColor: AppColor.gold,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onBackToIntro(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onBackToIntro(context),
              child: const Text('Back to Introduction'),
            ),
          ],
        ),
      ),
    );
  }
}
