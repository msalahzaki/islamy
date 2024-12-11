import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/HadithBG.png'), // Your image file
            fit: BoxFit.cover),
      ),
      child:Column(
        children: [
          Center(child: Image.asset("assets/images/Logo.png")),
          Expanded(
            child: CarouselSlider.builder(
            itemCount: 15,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              return Container(
                decoration: BoxDecoration(
                color: AppColor.primarycolor,
                borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10),
                child: Stack(alignment: Alignment.center,
                children: [
                Image.asset("assets/images/introScreen/3.png",color: AppColor.semiblack.withOpacity(0.3),width: size.width*.6,fit: BoxFit.cover,),
                Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/images/SuraScreen/tail.png",width: size.width*0.7 ,),
            
                ),
                Positioned(
                top: 0, // Position the right image near the top-right
                right: 0,
                child: ImageIcon(
                const AssetImage("assets/images/SuraScreen/Right.png"),
                size: size.width*0.2 ,
                color: AppColor.semiblack,
                ),
                ),
                Positioned(
                top: 0, // Position the left image near the top-left
                left: 0,
                child: ImageIcon(
                AssetImage("assets/images/SuraScreen/left.png"),
                size: size.width*0.2 ,
                color: AppColor.semiblack,
                ),
                ),
                ],
                ),
            
                );
            },
             options: CarouselOptions(
               height: size.height,
               enlargeCenterPage: true
             ),
                ),
          )

]
      )
    );

  }
}
