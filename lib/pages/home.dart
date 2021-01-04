import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 140, 20, 0),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/${data['isDay']}'),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic rs = await Navigator.pushNamed(context, '/choose-location');
                    setState(() {
                      data = {
                        'location': rs['location'],
                        'flag': rs['flag'],
                        'time': rs['time'],
                        'isDay': rs['isDay'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.not_listed_location,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Choose Location',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
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
