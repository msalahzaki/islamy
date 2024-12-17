import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_styles.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_color.dart';
import '../../../model/parytime_model.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  PraytimeModel? praytime;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.TimeBG), // Your image file
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Image.asset(AppAssets.Logo),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
              height: size.height * .35,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(40)),
                color: const Color(0xff856b3f),
                image: DecorationImage(
                    image: AssetImage(AppAssets.Time_Widget_BG),
                    fit: BoxFit.fill),
              ),
              child: praytime == null
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColor.white,
                    ))
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        CarouselSlider.builder(
                            itemCount: praytime!.timings.length,
                            itemBuilder: (context, index, realIndex) {
                              String key =
                                  praytime!.timings.keys.elementAt(index);
                              String value =
                                  praytime!.timings.values.elementAt(index);
                              return Container(
                                width: size.width * .5,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xff202020),
                                          Color(0xffB19768)
                                        ])),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      key,
                                      style: AppStyles.bold16white,
                                    ),
                                    Text(
                                      value,
                                      style: AppStyles.bold36white
                                          .copyWith(fontSize: 30),
                                    )
                                  ],
                                ),
                              );
                            },
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              viewportFraction: 0.25,
                              enlargeFactor: 0.15,
                              height: size.height * .15,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 60,
                              child: Text(
                                praytime!.date,
                                style: AppStyles.bold16white,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "   Pray Time",
                                  style: AppStyles.bold20semiprimary,
                                ),
                                Text(
                                  praytime!.day,
                                    style: AppStyles.bold20black),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                praytime!.HajriDate,
                                textAlign: TextAlign.center,
                                style: AppStyles.bold16white,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Next Pray - ",
                                style: TextStyle(color: AppColor.black),
                              ),
                              const Text("Time",
                                  style: TextStyle(color: AppColor.black)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.volume_mute,
                                    size: 25,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void getdata() async {
    praytime = await PrayTime.fetchParyTimeData();

    setState(() {});
  }
}
