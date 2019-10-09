import 'package:flutter/material.dart';
import 'Screens/splash_screen.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:SplashScreen() ,
    theme: ThemeData(
      primaryColor: Colors.green.shade600
    ),
  ));
}
