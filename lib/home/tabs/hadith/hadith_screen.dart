import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/core/utils/app_styles.dart';
import 'package:islamy/home/tabs/hadith/hadith_details.dart';
import 'package:islamy/model/hadith_model.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_color.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<HadithModel> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) readAssetFile();
    Size size = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.HadithBG), // Your image file
              fit: BoxFit.cover),
        ),
        child: Column(children: [
          Center(child: Image.asset(AppAssets.Logo)),
          hadithList.isNotEmpty
              ? Expanded(
                  child: CarouselSlider.builder(
                    itemCount: hadithList.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return HadithDetails(
                                  arabicTitle: hadithList[itemIndex].title,
                                  content: hadithList[itemIndex].content);
                            },
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.primarycolor,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(10),
                          //margin: const EdgeInsets.only(right: 10),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                "assets/images/introScreen/3.png",
                                color: AppColor.semiblack.withOpacity(0.2),
                                width: size.width * .6,
                                fit: BoxFit.cover,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Image.asset(
                                  AppAssets.tail,
                                  width: size.width * 0.7,
                                ),
                              ),
                              Positioned(
                                top:
                                    0, // Position the right image near the top-right
                                right: 0,
                                child: ImageIcon(
                                  AssetImage(AppAssets.Right),
                                  size: size.width * 0.2,
                                  color: AppColor.semiblack,
                                ),
                              ),
                              Positioned(
                                top:
                                    0, // Position the left image near the top-left
                                left: 0,
                                child: ImageIcon(
                                  AssetImage(AppAssets.left),
                                  size: size.width * 0.2,
                                  color: AppColor.semiblack,
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: size.height * .02,
                                  ),
                                  Text(
                                    hadithList[itemIndex].title,
                                    style: AppStyles.bold24black,
                                  ),
                                  SizedBox(
                                    height: size.height * .03,
                                  ),
                                  Expanded(
                                      child: Text(
                                    softWrap: true,
                                    textDirection: TextDirection.rtl,
                                    hadithList[itemIndex].content,
                                          style: AppStyles.bold16black)),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: size.height,
                      enlargeCenterPage: true,
                      viewportFraction: 0.75,
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: AppColor.primarycolor,
                )),
        ]));
  }

  readAssetFile() async {
    for (int i = 1; i <= 50; i++) {
      String assetPath = 'assets/Hadeeth/h$i.txt'; // Dynamically set file path
      String Hadeeth = await rootBundle.loadString(assetPath);
      List<String> lines = Hadeeth.split('\n');
      String firstLine = lines[0];
      String restOfText = lines.sublist(1).join('\n');
      // titleList.add(firstLine);
      // contentList.add(restOfText);

      hadithList.add(HadithModel(title: firstLine, content: restOfText));
    }
    setState(() {});
  }
}
