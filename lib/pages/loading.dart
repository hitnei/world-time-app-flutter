import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
