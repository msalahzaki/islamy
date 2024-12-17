import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_styles.dart';
import 'package:islamy/model/sura_model.dart';

import '../sura_screen.dart';

class SuraListTile extends StatelessWidget {
  const SuraListTile(
      {super.key,
      required this.sura,
      required this.index,
      required this.refreshrecent});

  final SuraModel sura;
  final int index;
  final Function() refreshrecent;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SuraScreen(
                      arabicTitle: sura.arabicName,
                      englishTitle: sura.englishName,
                      number: sura.num,
                    ))).then((_) {
          refreshrecent();
        });
      },
      leading: Stack(alignment: Alignment.center, children: [
        Image.asset(
          "assets/icons/Surra_num.png",
          height: 52,
        ),
        Text(
          "${sura.num}",
          style: AppStyles.bold20white.copyWith(fontSize: 16),
        )
      ]),
      title: Text(
        sura.englishName,
        style: AppStyles.bold20white,
      ),
      subtitle: Text("${sura.VersesNums} Verses",
        style: AppStyles.bold14white,
      ),
      trailing: Text(
        sura.arabicName,
        style: AppStyles.bold20white,
      ),
    );
  }
}
