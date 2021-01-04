import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String url; // url get data
  String flag; // flag image
  String time; // hour:min
  String location; // location
  String isDay;

  WorldTime({this.url, this.location, this.flag});

  Future<void> getTime() async {
    Response res = await get('http://worldtimeapi.org/api/timezone/$url');
    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body);
      String utcDateTime = data['utc_datetime'];
      int utcOffset = int.parse(data['utc_offset'].substring(1, 3));

      DateTime now = DateTime.parse(utcDateTime).add(Duration(hours: utcOffset));
      time = DateFormat.jm().format(now).toString();
      isDay = now.hour > 6 && now.hour < 19 ? "day.png" : "night.png";
    } else {
      time = DateFormat.jm().format(DateTime.now()).toString();
      isDay = DateTime.now().hour > 6 && DateTime.now().hour < 19 ? "day.png" : "night.png";
    }
  }
}