import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico City', flag: 'usa.png'),
  ];

  void updateTime(int index) async {
    WorldTime data = locations[index];
    await data.getTime();
    Navigator.pop(context, {
      'location': data.location,
      'flag': data.flag,
      'time': data.time,
      'isDay': data.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Location'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        updateTime(index);
                      },
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/${locations[index].flag}'),
                      ),
                      title: Text(locations[index].location),
                    ),
                  ),
                );
              }),
        ));
  }
}
