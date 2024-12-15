import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/core/utils/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SuraScreen extends StatefulWidget {
  const SuraScreen(
      {super.key,
      required this.number,
      required this.arabicTitle,
      required this.englishTitle});

  final int number;
  final String arabicTitle;
  final String englishTitle;

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  late String content;

  @override
  void initState() {
    super.initState();
    content = '';
    readAssetAndPrintFile().then((_) => _updateRecentSuras());
  }

  @override
  void dispose() {
    super.dispose();
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
                child: content.isNotEmpty
                    ? SingleChildScrollView(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30),
                            child: Text(
                                textAlign: TextAlign.justify,
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(
                                    color: AppColor.primarycolor, fontSize: 16),
                                content)),
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

  Future<void> readAssetAndPrintFile() async {
    content = "";
    String assetPath =
        'assets/Suras/${widget.number}.txt'; // Dynamically set file path
    int i = 1;
    try {
      // Read lines from the asset file
      final lines = await readAssetFileLineByLine(assetPath);

      // Process all lines
      for (var line in lines) {
        content += "${line.trim()} ($i) ";
        i++;
      }
// Print the final concatenated content
    } catch (e) {
      print("Error reading asset file: $e");
    }
    setState(() {});
  }

  Future<List<String>> readAssetFileLineByLine(String assetPath) async {
    final fileData =
        await rootBundle.loadString(assetPath); // Load file content
    return fileData
        .split(RegExp(r'\r?\n')) // Split into lines
        .where((line) =>
            line.trim().isNotEmpty) // Remove empty or whitespace-only lines
        .toList();
  }

  _updateRecentSuras() async {
    final prefs = await SharedPreferences.getInstance();
    final lastIndex = prefs.getInt('last_index');

    if (lastIndex != null) {
      await prefs.setInt('prelast_index', lastIndex);
    }

    await prefs.setInt('last_index', widget.number - 1);
  }
}