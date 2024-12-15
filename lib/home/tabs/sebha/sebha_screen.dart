import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_color.dart';

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
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/SebhaBG.png'), // Your image file
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
            Image.asset("assets/images/Logo.png"),
            const Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
              style: TextStyle(color: AppColor.white, fontSize: 30),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                    angle: (count * 65) / 360,
                    child: SizedBox(
                        width: 350,
                        child: Image.asset("assets/images/Sebha.png"))),
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    height: size.height * .05,
                  ),
                  SizedBox(
                    width: size.width * 0.45,
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.azkar[zkarNum],
                      style:
                          const TextStyle(color: AppColor.white, fontSize: 36),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .04,
                  ),
                  Text(
                    "$count",
                    style: const TextStyle(color: AppColor.white, fontSize: 30),
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
