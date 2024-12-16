import 'dart:convert';

import 'package:http/http.dart' as http;

class PraytimeModel {
  final Map<String, dynamic> timings;
  final String date;
  final String HajriDate;
  final String day;

  PraytimeModel(
      {required this.timings,
      required this.date,
      required this.HajriDate,
      required this.day});
}

class PrayTime {
  static Future<PraytimeModel> fetchParyTimeData() async {
    DateTime now = DateTime.now();
    String date = "${now.day}-${now.month}-${now.year}";

    final response = await http.get(Uri.parse(
        'https://api.aladhan.com/v1/timingsByCity/$date?city=alexandria&country=egypt'));
    if (response.statusCode == 200) {
      var resonse = jsonDecode(response.body)['data'];

      return PraytimeModel(
        timings: resonse["timings"],
        date: resonse["date"]["readable"],
        HajriDate: resonse["date"]["hijri"]["day"] +
            " " +
            resonse["date"]["hijri"]["month"]["en"] +
            " " +
            resonse["date"]["hijri"]["year"],
        day: resonse["date"]["gregorian"]["weekday"]["en"],
      );
    } else {
      throw Exception('Failed to load radios');
    }
  }
}
