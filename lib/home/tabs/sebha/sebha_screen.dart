import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_styles.dart';

import '../../../core/utils/app_assets.dart';

class SebhaScreen extends StatefulWidget {
  SebhaScreen({super.key});
  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
    "لاحول ولا قوة الا بالله"
  ];
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int zkarNum = 0;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.SebhaBG), // Your image file
            fit: BoxFit.cover),
      ),
      child: GestureDetector(
        onTap: () {
          if (count >= 33) {
            count = 0;
            zkarNum == widget.azkar.length - 1 ? zkarNum = 0 : zkarNum++;
          } else {
            count++;
          }

          setState(() {});
        },
        onHorizontalDragEnd: (details) {
          // Check the direction of the horizontal drag
          if (details.primaryVelocity! > 0) {
            zkarNum == 0 ? zkarNum = widget.azkar.length - 1 : zkarNum--;
            count = 0;
            // back();
          } else if (details.primaryVelocity! < 0) {
            // Swiping from right to left
            zkarNum == widget.azkar.length - 1 ? zkarNum = 0 : zkarNum++;
            count = 0;
          }

          setState(() {});
        },
        child: Column(
          children: [
            Image.asset(AppAssets.Logo),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: AppStyles.bold36white,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                // AnimatedRotation(
                //   turns: (count * 11) / 360,
                //   duration: Duration(seconds: 1),
                //    child : SizedBox(
                //                         width: 350,
                //                         child: Image.asset(AppAssets.Sebha)),
                // ),

                Transform.rotate(
                    angle: (count * 65) / 360,
                    child: SizedBox(
                        width: 350, child: Image.asset(AppAssets.Sebha))),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    height: size.height * .05,
                  ),
                  SizedBox(
                    width: size.width * 0.45,
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.azkar[zkarNum],
                      style: AppStyles.bold36white,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .04,
                  ),
                  Text(
                    "$count",
                    style: AppStyles.bold36white,
                  ),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
