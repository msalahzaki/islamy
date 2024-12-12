import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_color.dart';

class HadithDetails extends StatefulWidget {
  HadithDetails(
      {super.key,
      required this.arabicTitle,
      this.englishTitle = " ",
      required this.content});

  final String content;
  final String arabicTitle;
  final String englishTitle;

  @override
  State<HadithDetails> createState() => _HadithDetailsState();
}

class _HadithDetailsState extends State<HadithDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.englishTitle,
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/SuraScreen/tail.png")),
          Align(
            alignment: Alignment.topRight,
            child: ImageIcon(
              const AssetImage("assets/images/SuraScreen/Right.png"),
              size: size.width * 0.2,
              color: AppColor.primarycolor,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: ImageIcon(
              const AssetImage("assets/images/SuraScreen/left.png"),
              size: size.width * 0.2,
              color: AppColor.primarycolor,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * .02,
              ),
              Text(
                widget.arabicTitle,
                style:
                    const TextStyle(color: AppColor.primarycolor, fontSize: 20),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Expanded(
                child: widget.content.isNotEmpty
                    ? SingleChildScrollView(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: Text(
                                textAlign: TextAlign.justify,
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                    color: AppColor.primarycolor, fontSize: 16),
                                widget.content)),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                        color: AppColor.primarycolor,
                      )),
              )
            ],
          )
        ],
      ),
    );
  }
}
