import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_color.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

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
              height: 280,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Color(0xff856b3f),
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/Time_Widget_BG.png'), // Your image file
                    fit: BoxFit.fill),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CarouselSlider.builder(
                      itemCount: 10,
                      itemBuilder: (context, index, realIndex) {
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
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [Text("ASR"), Text("data \n PM")],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        viewportFraction: 0.3,
                        height: 150,
                      )),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "15 Dec 2024",
                        style: TextStyle(fontSize: 15),
                      ),
                      Column(
                        children: [
                          Text(
                            "   Pray Time",
                            style: TextStyle(
                                color: Color(0xff856b3f), fontSize: 20),
                          ),
                          Text(
                            "Day",
                            style:
                                TextStyle(fontSize: 20, color: AppColor.black),
                          ),
                        ],
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "13 \n Jumādá \nal-ākhirah \n 1446",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
}
