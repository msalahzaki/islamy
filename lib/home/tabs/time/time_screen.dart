import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/TimeBG.png'), // Your image file
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Image.asset("assets/images/Logo.png"),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
              height: size.height * .35,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Color(0xff856b3f),
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/Time_Widget_BG.png'), // Your image file
                    fit: BoxFit.fill),
              ),
              child: praytime == null
                  ? Center(
                      child: const CircularProgressIndicator(
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
                                  children: [Text(key), Text(value)],
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
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Column(
                              children: [
                                const Text(
                                  "   Pray Time",
                                  style: TextStyle(
                                      color: Color(0xff856b3f), fontSize: 20),
                                ),
                                Text(
                                  praytime!.day,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColor.black,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 60,
                              child: Text(
                                praytime!.HajriDate,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
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
