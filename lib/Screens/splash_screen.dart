import 'dart:async';
import "package:flutter/material.dart";
import 'HomePage.dart';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState  extends State<SplashScreen>{

  @override
  void initState() {
    Route route = MaterialPageRoute(builder: (context) => HomePage());
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context, route) );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Stack(
        fit:StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[ Colors.lightGreenAccent,Colors.lightGreen.shade600],
                begin: Alignment.bottomCenter,
                end : Alignment.topCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60.0,
                child: Icon(
                  Icons.restaurant,
                  color: Colors.lightGreen,
                  size: 65.0,
                ),
              ),
              Text(
                'Welcome to Easy Order !!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0)
              ),
            ],
          ),
        ],
      ),
    );

  }

}

