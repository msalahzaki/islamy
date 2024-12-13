

class ChanelModel {
  final int id;
  final String name;
  final String url;
  ChanelModel({required this.id, required this.name, required this.url});

  factory ChanelModel.fromJson(Map<String, dynamic> json) {
    return ChanelModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
    );
  }
}

class RadioList {
  final List<ChanelModel> radios;

  RadioList({required this.radios});

  factory RadioList.fromJson(Map<String, dynamic> json) {
    var radioList = json['radios'] as List;
    List<ChanelModel> radios = radioList.map((radio) {
      return ChanelModel.fromJson(radio);
    }).toList();
    return RadioList(radios: radios);
  }
}

class RecruiterChanel {

}