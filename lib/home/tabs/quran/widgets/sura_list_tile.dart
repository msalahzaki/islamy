import 'package:flutter/material.dart';
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
          height: 40,
        ),
        Text("${sura.num}")
      ]),
      title: Text(
        sura.englishName,
        style: const TextStyle(fontSize: 20),
      ),
      subtitle: Text("${sura.VersesNums} Verses",
          style: const TextStyle(fontSize: 14)),
      trailing: Text(sura.arabicName, style: const TextStyle(fontSize: 20)),
    );
  }
}
