import 'package:flutter/material.dart';
import 'package:islamy/home/tabs/quran/sura_screen.dart';
import 'package:islamy/home/tabs/quran/widgets/recent_suras.dart';
import 'package:islamy/home/tabs/quran/widgets/sura_list_tile.dart';
import 'package:islamy/model/sura_model.dart';
import 'package:islamy/model/suras_list.dart';

import '../../../core/utils/app_color.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  String keyword ='';
  bool show = true;


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
              onChanged: (value) {
                keyword = value;
                value.isEmpty ? show=true :show=false ;
                setState(() {
                });
              },
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
            RecentSuras(isVisable: show),
            const SizedBox(height: 10),
            if (show) const Text("Suras List"),
            if (show) const SizedBox(height: 15),
            Expanded(
                child: ListView.builder(
              itemCount: SuraModel.getItemCount(),
              itemBuilder: (context, index) {
               if ( SuraModel.getSuraModel(index).englishName.toLowerCase().contains(keyword) ||
                   SuraModel.getSuraModel(index).arabicName.toLowerCase().contains(keyword))
                   {
               return SuraListTile(sura: SuraModel.getSuraModel(index));
               }
                else
                return SizedBox.shrink() ;
              },
              padding: const EdgeInsets.all(0),
            )),
          ],
        ));
  }

}
