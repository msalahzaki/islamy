import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_color.dart';
import 'package:islamy/home/tabs/radio/widget/channel_card.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int selected = 0;
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    print(selected);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/RadioBG.png'), // Your image file
            fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/Logo.png"),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: selected == 0
                        ? AppColor.primarycolor
                        : AppColor.semiblack,
                    foregroundColor:
                        selected == 0 ? AppColor.black : AppColor.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 70)),
                child: const Text(
                  "Radio",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  selected = 0;
                  setState(() {});
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: selected == 1
                        ? AppColor.primarycolor
                        : AppColor.semiblack,
                    foregroundColor:
                        selected == 1 ? AppColor.black : AppColor.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 70)),
                child: const Text("Reciters", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  selected = 1;
                  setState(() {});
                },
              ),
            ],
          ),
          Expanded(
              child: ListView(padding: EdgeInsets.symmetric(vertical: 20),itemExtent: 120,
            children: [
              ChannelCard(playPuaseFuction: playPuaseFuction,volumeFuction: volumeFuction),
              ChannelCard(playPuaseFuction: playPuaseFuction,volumeFuction: volumeFuction),
              ChannelCard(playPuaseFuction: playPuaseFuction,volumeFuction: volumeFuction),
              ChannelCard(playPuaseFuction: playPuaseFuction,volumeFuction: volumeFuction),


            ],
          ))
        ],
      ),
    );
  }
  playPuaseFuction(){
    player.play(UrlSource('https://backup.qurango.net/radio/ibrahim_alakdar'));
   // player.pause();

  }
  volumeFuction(){
    player.setVolume(0) ;
  }
}
