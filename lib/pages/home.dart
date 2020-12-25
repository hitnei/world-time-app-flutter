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
    print(data);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    print('choose location');
                    Navigator.pushNamed(context, '/choose-location');
                  },
                  icon: Icon(Icons.location_on_outlined),
                  label: Text('Choose Location'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
