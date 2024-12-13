import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class ChannelCard extends StatelessWidget {
   ChannelCard({super.key, required this.playPuaseFuction, required this.volumeFuction});
  final Function () playPuaseFuction;
  final Function () volumeFuction;
  @override
  Widget build(BuildContext context) {

    return  Container(
      margin: EdgeInsets.symmetric(vertical: 5),
     // height: 120,
      decoration: BoxDecoration(
          color: AppColor.primarycolor,
          borderRadius: BorderRadius.circular(20)),
      child: Stack(alignment: Alignment.topCenter,
        children: [
          Align(alignment: Alignment.bottomCenter,
            child: Image.asset(fit: BoxFit.fill,
              (Random().nextInt(100)%2 == 0)? 'assets/images/soundWave.png':'assets/images/SuraScreen/tail.png' ,
              color: AppColor.semiblack.withOpacity(0.3),
            ),
          ),
          Text(
            "Channel Name",
            style: TextStyle(color: AppColor.black, fontSize: 26),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
              IconButton(onPressed: playPuaseFuction, icon: Icon(Icons.pause)),
              IconButton(onPressed: volumeFuction, icon: Icon(Icons.volume_mute_sharp)),
            ],),
          )
        ],
      ),
    );
  }
}
