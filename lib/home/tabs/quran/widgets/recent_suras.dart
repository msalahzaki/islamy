import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class RecentSuras extends StatelessWidget {
  const RecentSuras({super.key, required this.isVisable});
final bool isVisable;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisable,
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
    );
  }
}
