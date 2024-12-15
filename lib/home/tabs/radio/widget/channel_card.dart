import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class ChannelCard extends StatefulWidget {
  ChannelCard(
      {super.key,
      required this.playPuaseFuction,
      required this.volumeFuction,
      required this.title,
      required this.index,
      required this.playicon});

  final Function(int) playPuaseFuction;
  final Function(int) volumeFuction;
  final int index;
  final String title;
  final IconData playicon;

  @override
  State<ChannelCard> createState() => _ChannelCardState();
}

class _ChannelCardState extends State<ChannelCard> {
  IconData volumeIcon = Icons.volume_down;
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    // Calculate the random image once during widget initialization
    selectedImage = (Random().nextInt(100) % 2 == 0)
        ? 'assets/images/SoundWave.png'
        : 'assets/images/SuraScreen/tail.png';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      // height: 120,
      decoration: BoxDecoration(
          color: AppColor.primarycolor,
          borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              widget.title,
              style: const TextStyle(
                  color: AppColor.black,
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Image.asset(
            fit: BoxFit.cover,
            selectedImage,
            color: AppColor.semiblack.withOpacity(0.3),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    widget.playPuaseFuction(widget.index);
                  },
                  icon: Icon(widget.playicon)),
              IconButton(
                  onPressed: () {
                    widget.volumeFuction(widget.index);
                    if (widget.playicon == Icons.pause) {
                      volumeIcon == Icons.volume_down
                          ? volumeIcon = Icons.volume_mute
                          : volumeIcon = Icons.volume_down;
                    }
                    setState(() {});
                  },
                  icon: Icon(volumeIcon)),
            ],
          )
        ],
      ),
    );
  }
}
