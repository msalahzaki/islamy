import 'package:flutter/material.dart';
import 'package:islamy/core/utils/app_assets.dart';
import 'package:islamy/core/utils/app_color.dart';
import 'package:islamy/core/utils/app_styles.dart';

class HadithDetails extends StatefulWidget {
  const HadithDetails(
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
              child: Image.asset(AppAssets.tail)),
          Align(
            alignment: Alignment.topRight,
            child: ImageIcon(
              AssetImage(AppAssets.Right),
              size: size.width * 0.2,
              color: AppColor.primarycolor,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: ImageIcon(
              AssetImage(AppAssets.left),
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
                style: AppStyles.bold24primary,
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
                                style: AppStyles.bold20primary,
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
