import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime initWorldTime =
        WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'rome.png');
    await initWorldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': initWorldTime.location,
      'flag': initWorldTime.flag,
      'time': initWorldTime.time,
      'isDay': initWorldTime.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading screen'),
      ),
    );
  }
}
