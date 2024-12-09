import 'package:flutter/material.dart';
import 'package:islamy/model/dat_lists.dart';

import '../../../core/utils/app_color.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  bool show = true;
  List<Map<String, dynamic>> quranSurahs = DatLists.quranSurahs;

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
            if (show)  const SizedBox(height: 15),
            Expanded(
                child: ListView.builder(
              itemCount: quranSurahs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Stack(alignment: Alignment.center, children: [
                    Image.asset(
                      "assets/icons/Surra_num.png",
                      height: 40,
                    ),
                    Text("${quranSurahs[index]["number"]}")
                  ]),
                  title: Text(
                    "${quranSurahs[index]["englishName"]}",
                    style: const TextStyle(fontSize: 20),
                  ),
                  subtitle: Text("${quranSurahs[index]["verses"]} Verses",
                      style: const TextStyle(fontSize: 14)),
                  trailing: Text("${quranSurahs[index]["arabicName"]}",
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
      // if the search field is empty or only contains white-space, we'll display all users
      quranSurahs = DatLists.quranSurahs;
      show = true;
    } else {
      final keyword = enteredKeyword.toLowerCase();
      quranSurahs = quranSurahs.where((sura) {
        return sura["englishName"].toLowerCase().contains(keyword) ||
            sura["arabicName"].toLowerCase().contains(keyword);
      }).toList();
      show = false;
    }
    setState(() {});
  }
}
