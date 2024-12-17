import 'dart:convert';

import 'package:http/http.dart' as http;

class ChanelModel {
  final int id;
  final String name;
  final String url;
  ChanelModel({required this.id, required this.name, required this.url});

}

class RadioList {
  static List<ChanelModel> radios = [];

  static Future<List<ChanelModel>> fetchRadios() async {
    final response = await http
        .get(Uri.parse('https://mp3quran.net/api/v3/radios?language=ar'));
    if (response.statusCode == 200) {
      var resonse = jsonDecode(response.body)['radios'];
      for (int i = 0; i < resonse.length; i++) {
        radios.add(ChanelModel(
            id: resonse[i]["id"],
            name: resonse[i]["name"],
            url: resonse[i]["url"]));
      }
      return radios;
    } else {
      throw Exception('Failed to load radios');
    }
  }
}

class RecruiterChanel {

}