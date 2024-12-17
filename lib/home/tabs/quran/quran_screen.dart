import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_styles.dart';
import 'package:islamy/home/tabs/quran/widgets/recent_suras.dart';
import 'package:islamy/home/tabs/quran/widgets/sura_list_tile.dart';
import 'package:islamy/model/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_color.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  int? last_index;
  int? prelast_index;
  String keyword ='';
  bool show = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getRecentindex();
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.QuranBG), // Your image file
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(AppAssets.Logo)),
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
                hintStyle: AppStyles.bold16gold,
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
            if (show) Text("Most Recent", style: AppStyles.bold16gold),
            const SizedBox(
              height: 10,
            ),
            RecentSuras(
                isVisable: show,
                last_index: this.last_index,
                prelast_index: this.prelast_index),
            const SizedBox(height: 10),
            if (show) Text("Suras List", style: AppStyles.bold16gold),
            if (show) const SizedBox(height: 15),
            Expanded(
                child: ListView.builder(
              itemCount: SuraModel.getItemCount(),
              itemBuilder: (context, index) {
               if ( SuraModel.getSuraModel(index).englishName.toLowerCase().contains(keyword) ||
                   SuraModel.getSuraModel(index).arabicName.toLowerCase().contains(keyword))
                   {
                  return SuraListTile(
                      sura: SuraModel.getSuraModel(index),
                      index: index,
                      refreshrecent: getRecentindex);
                } else {
                  return const SizedBox.shrink();
                }
              },
              padding: const EdgeInsets.all(0),
            )),
          ],
        ));
  }

  void getRecentindex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (last_index != prefs.getInt('last_index')) {
      last_index = prefs.getInt('last_index');
      prelast_index = prefs.getInt('prelast_index');
      setState(() {});
    }
  }
}
