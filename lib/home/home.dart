import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_color.dart';
import 'package:islamy/home/tabs/hadith/hadith_screen.dart';
import 'package:islamy/home/tabs/quran/quran_screen.dart';
import 'package:islamy/home/tabs/radio/radio_screen.dart';
import 'package:islamy/home/tabs/sepha/sepha_screen.dart';
import 'package:islamy/home/tabs/time/time_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> currentTab = [
       QuranScreen(),
      const HadithScreen(),
      const SephaScreen(),
      const RadioScreen(),
      const TimeScreen()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedndex,
          backgroundColor: AppColor.primarycolor,
          onTap: (index) {
            selectedndex = index;
            setState(() {});
          },
          selectedItemColor: AppColor.white,
          unselectedItemColor: AppColor.black,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: imageicon(0, "assets/icons/Quran_icon.png"),
                label: "Quran"),
             BottomNavigationBarItem(
                icon: imageicon(1,"assets/icons/Hadith_icon.png"),
                label: "Hadith"),
             BottomNavigationBarItem(
                icon:imageicon(2,"assets/icons/Sebha_icon.png"),

                label: "Sepha"),
             BottomNavigationBarItem(
                icon: imageicon(3,"assets/icons/Radio_icon.png"),

                label: "Radio"),
             BottomNavigationBarItem(
                icon:imageicon(4,"assets/icons/Time_icon.png"),

                label: "Time"),
          ]),
      body: currentTab[selectedndex],
    );
  }

  Widget imageicon(int itemIndex, String iconPath) {
    return itemIndex == selectedndex
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColor.semiblack,
            ),
            child: ImageIcon(AssetImage(iconPath)))
        : ImageIcon(AssetImage(iconPath));
  }
}
