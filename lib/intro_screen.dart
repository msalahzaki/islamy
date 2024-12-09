import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamy/core/utils/app_color.dart';
import 'package:islamy/home/home.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: AppColor.primarycolor,
          color: AppColor.semiblack,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
      // 2. Pass that key to the `IntroductionScreen` `key` param
      key: _introKey,
      pages: [
        intropage("1", "Welcome To Islmi App", ""),
        intropage("2", "Welcome To Islmi App",
            "We Are Very Excited To Have You In Our Community"),
        intropage("3", "Reading the Quran",
            "Read, and your Lord is the Most Generous"),
        intropage(
            "4", "Bearish", "Praise the name of your Lord, the Most High"),
        intropage("5", "Holy Quran Radio",
            "You can listen to the Holy Quran Radio through the application for free and easily"),
      ],
      next: const Text("Next",style: TextStyle(color: AppColor.primarycolor),),
      done: const Text("Finish",style: TextStyle(color: AppColor.primarycolor)),
      back: const Text("Back",style: TextStyle(color: AppColor.primarycolor)),
      showBackButton: true,
      showNextButton: true,
      showDoneButton: true,
      onDone: () => Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home())),
    );
  }

  PageViewModel intropage(String image, String title, String subTitle) {
    return PageViewModel(
        title: "",
        bodyWidget: Column(
          children: [
            Image.asset("assets/images/introScreen/Logo.png"),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 350,
                child: Image.asset("assets/images/introScreen/$image.png")),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(color: AppColor.primarycolor, fontSize: 24),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              subTitle,
              style: TextStyle(color: AppColor.primarycolor, fontSize: 14),
            ),
          ],
        ));
  }
}
