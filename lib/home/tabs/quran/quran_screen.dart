import 'package:flutter/material.dart';
import 'package:islamy/model/dat_lists.dart';

import '../../../core/utils/app_color.dart';

class QuranScreen extends StatelessWidget {
   QuranScreen({super.key});
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
              decoration: InputDecoration(
                prefixIcon: const ImageIcon(
                  AssetImage("assets/icons/Quran_Search.png"),
                  color: AppColor.primarycolor,
                ),
                hintText: "Sura Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: AppColor.primarycolor, width: 2)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Most Recent"),
            const SizedBox(
              height: 10,
            ),
            SizedBox(  height: 130,
              child:
                ListView(
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
                    )
                  ],
                ),

            ),
            const SizedBox(
              height: 10,
            ),
            const Text("Suras List"),
            const SizedBox(
              height: 15,
            ),
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
                      title:Text ("${quranSurahs[index]["englishName"]}",style: TextStyle(fontSize: 20),),
                      subtitle: Text ("${quranSurahs[index]["verses"]} Verses" ,style: TextStyle(fontSize: 14)),
                      trailing: Text("${quranSurahs[index]["arabicName"]}",style: TextStyle(fontSize: 20)),
                    );
                         },
              padding: EdgeInsets.all(0),

            ))
          ],
        ));
  }
}
