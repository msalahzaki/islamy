import 'package:flutter/material.dart';
import 'package:islamy/home/tabs/quran/sura_screen.dart';
import 'package:islamy/model/suras_list.dart';

import '../../../core/utils/app_color.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  bool show = true;


  List arabicQuranSuras = SurasList.arabicQuranSuras;
  List englishQuranSurahs = SurasList.englishQuranSurahs;
  List AyaNumber = SurasList.AyaNumber;
  List suraNumber = SurasList.suraNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/QuranBG.png'), // Your image file
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/images/Logo.png")),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                prefixIcon: const ImageIcon(
                  AssetImage("assets/icons/Quran_Search.png"),
                  color: AppColor.primarycolor,
                ),
                hintText: "Sura Name",
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: AppColor.primarycolor, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: AppColor.primarycolor, width: 2)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (show) Text("Most Recent"),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: show,
              child: SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.primarycolor,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            children: [
                              Text(
                                "Sura English ",
                                style: TextStyle(color: AppColor.black),
                              ),
                              Text("Sura Arabic ",
                                  style: TextStyle(color: AppColor.black)),
                              Text("546 Verses ",
                                  style: TextStyle(color: AppColor.black)),
                            ],
                          ),
                          Image.asset("assets/images/Sura_image.png")
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColor.primarycolor,
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            children: [
                              Text(
                                "Sura English ",
                                style: TextStyle(color: AppColor.black),
                              ),
                              Text("Sura Arabic ",
                                  style: TextStyle(color: AppColor.black)),
                              Text("546 Verses ",
                                  style: TextStyle(color: AppColor.black)),
                            ],
                          ),
                          Image.asset("assets/images/Sura_image.png")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (show) const Text("Suras List"),
            if (show) const SizedBox(height: 15),
            Expanded(
                child: ListView.builder(
              itemCount: AyaNumber.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuraScreen(
                                  arabicTitle: arabicQuranSuras[index],
                                  englishTitle: englishQuranSurahs[index],
                                  number: suraNumber[index],
                                )));
                  },
                  leading: Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      "assets/icons/Surra_num.png",
                      height: 40,
                    ),
                    Text("${suraNumber[index]}")
                  ]),
                  title: Text(
                    "${englishQuranSurahs[index]}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text("${AyaNumber[index]} Verses",
                      style: const TextStyle(fontSize: 14)),
                  trailing: Text("${arabicQuranSuras[index]}",
                      style: const TextStyle(fontSize: 20)),
                );
              },
              padding: const EdgeInsets.all(0),
            )),
          ],
        ));
  }

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      arabicQuranSuras = SurasList.arabicQuranSuras;
      englishQuranSurahs = SurasList.englishQuranSurahs;
      AyaNumber = SurasList.AyaNumber;
      suraNumber = SurasList.suraNumber;
      show = true;
    } else {
      List FilterdarabicQuranSuras = [];
      List FilterdenglishQuranSurahs = [];
      List FilterdAyaNumber = [];
      List FilterdsuraNumber = [];
      final keyword = enteredKeyword.toLowerCase();
      for (int i = 0; i < SurasList.englishQuranSurahs.length; i++) {
        if (SurasList.englishQuranSurahs[i].toLowerCase().contains(keyword) ||
            SurasList.arabicQuranSuras[i].toLowerCase().contains(keyword)) {
          FilterdarabicQuranSuras.add(SurasList.arabicQuranSuras[i]);
          FilterdenglishQuranSurahs.add(SurasList.englishQuranSurahs[i]);
          FilterdAyaNumber.add(SurasList.AyaNumber[i]);
          FilterdsuraNumber.add(SurasList.suraNumber[i]);
        }
      }
      arabicQuranSuras = FilterdarabicQuranSuras;
      englishQuranSurahs = FilterdenglishQuranSurahs;
      AyaNumber = FilterdAyaNumber;
      suraNumber = FilterdsuraNumber;
      show = false;
    }

    setState(() {});
  }
}
