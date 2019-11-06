import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Screens/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:SplashScreen() ,
    theme: ThemeData(
      primaryColor: Colors.green.shade600
    ),
  ));
}

void temp() {
  Firestore.instance
      .collection("cart")
      .where('tableNumber', isEqualTo: 5)
      .getDocuments()
      .then((doc) {
    // print(doc.documents.length);
    for (var i = 0; i < doc.documents.length; i++) {
      print(doc.documents[i].documentID);
    }
  });
}
