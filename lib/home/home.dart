import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_color.dart';
import 'package:islamy/home/tabs/hadith/hadith_screen.dart';
import 'package:islamy/home/tabs/quran/quran_screen.dart';
import 'package:islamy/home/tabs/radio/radio_screen.dart';
import 'package:islamy/home/tabs/sebha/sebha_screen.dart';
import 'package:islamy/home/tabs/time/time_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> currentTab = [
      const QuranScreen(),
      const HadithScreen(),
      SebhaScreen(),
      const RadioScreen(),
      const TimeScreen()
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          backgroundColor: AppColor.primarycolor,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          selectedItemColor: AppColor.white,
          unselectedItemColor: AppColor.black,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: imageIcon(0, "assets/icons/Quran_icon.png"),
                label: "Quran"),
            BottomNavigationBarItem(
                icon: imageIcon(1, "assets/icons/Hadith_icon.png"),
                label: "Hadith"),
            BottomNavigationBarItem(
                icon: imageIcon(2, "assets/icons/Sebha_icon.png"),
                label: "Sepha"),
            BottomNavigationBarItem(
                icon: imageIcon(3, "assets/icons/Radio_icon.png"),
                label: "Radio"),
            BottomNavigationBarItem(
                icon: imageIcon(4, "assets/icons/Time_icon.png"),
                label: "Time"),
          ]),
      body: currentTab[selectedIndex],
    );
  }

  Widget imageIcon(int itemIndex, String iconPath) {
    return itemIndex == selectedIndex
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
