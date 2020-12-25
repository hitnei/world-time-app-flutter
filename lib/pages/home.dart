import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/${data['isDay']}'),
              fit: BoxFit.cover,
            )
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/choose-location');
                  },
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Choose Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
