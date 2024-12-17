import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_styles.dart';
import 'package:islamy/model/sura_model.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../sura_screen.dart';

class RecentSuras extends StatefulWidget {
  RecentSuras(
      {super.key,
      required this.isVisable,
      this.last_index,
      this.prelast_index});
  final bool isVisable;
  final int? last_index;
  final int? prelast_index;

  @override
  State<RecentSuras> createState() => _RecentSurasState();
}

class _RecentSurasState extends State<RecentSuras> {
  String arabicName = '';
  String englishName = '';
  String versesNum = '';
  late String arabicName2 = '';
  late String englishName2 = '';
  late String versesNum2 = '';

  @override
  void initState() {
    super.initState();
    initRecent();
  }

  @override
  Widget build(BuildContext context) {
    initRecent();
    return Visibility(
      visible: widget.isVisable,
      child: SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SuraScreen(
                              arabicTitle: arabicName,
                              englishTitle: englishName,
                              number: widget.last_index! + 1,
                            )));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColor.primarycolor,
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          englishName,
                          style: AppStyles.bold24black,
                        ),
                        Text(arabicName, style: AppStyles.bold24black),
                        Text('$versesNum Verses', style: AppStyles.bold14black),
                      ],
                    ),
                    Image.asset(AppAssets.Sura_image)
                  ],
                ),
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
                  Column(
                    children: [
                      Text(
                        englishName2,
                        style: AppStyles.bold24black,
                      ),
                      Text(arabicName2, style: AppStyles.bold24black),
                      Text('$versesNum2 Verses', style: AppStyles.bold14black),
                    ],
                  ),
                  Image.asset(AppAssets.Sura_image)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void initRecent() async {
    if (widget.last_index != null) {
      arabicName = SuraModel.getSuraModel(widget.last_index!).arabicName;
      englishName = SuraModel.getSuraModel(widget.last_index!).englishName;
      versesNum = SuraModel.getSuraModel(widget.last_index!).VersesNums;
    }
    if (widget.prelast_index != null) {
      arabicName2 = SuraModel.getSuraModel(widget.prelast_index!).arabicName;
      englishName2 = SuraModel.getSuraModel(widget.prelast_index!).englishName;
      versesNum2 = SuraModel.getSuraModel(widget.prelast_index!).VersesNums;
    }
  }
}
