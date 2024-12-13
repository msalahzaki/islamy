import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islamy/core/utils/app_color.dart';
import 'package:islamy/home/tabs/radio/widget/channel_card.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  List<dynamic> radios = [];
  String url = '';
  int selected = 0;
  int playedIndex = -1;
  int mutedIndex = -1;
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  @override
  dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/RadioBG.png'), // Your image file
            fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              height: size.height * .25,
              child: Image.asset("assets/images/Logo.png")),
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
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                ),
                child: const Text(
                  "Reciters",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  selected = 1;
                  setState(() {});
                },
              ),
            ],
          ),
          Expanded(
            child: radios.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(
                    color: AppColor.primarycolor,
                  ))
                : ListView.builder(
                    itemCount: radios.length,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    itemExtent: 150,
                    itemBuilder: (BuildContext context, int index) {
                      return ChannelCard(
                        title: "${radios[index]['name']}",
                        index: index,
                        playPuaseFuction: playPuaseFuction,
                        volumeFuction: volumeFuction,
                        playicon: (playedIndex == index)
                            ? Icons.pause
                            : Icons.play_arrow,
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }

  playPuaseFuction(int index) {
    if (!(index == playedIndex)) {
      player.stop();
      player.play(UrlSource(radios[index]['url']));
      playedIndex = index;
    } else {
      player.stop();
      playedIndex = -1;
    }
    setState(() {});
  }

  volumeFuction(index) {
    if ((index == playedIndex)) {
      player.volume == 0 ? player.setVolume(1) : player.setVolume(0);
    }
  }

  Future<void> fetchRadios() async {
    final response = await http
        .get(Uri.parse('https://mp3quran.net/api/v3/radios?language=ar'));

    if (response.statusCode == 200) {
      setState(() {
        radios = jsonDecode(response.body)['radios'];
      });
    } else {
      throw Exception('Failed to load radios');
    }
  }
}
