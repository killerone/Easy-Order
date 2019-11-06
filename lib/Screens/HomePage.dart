import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_order/Screens/DisplayCuisines.dart';
import 'package:flutter/material.dart';
import './drawer.dart';
import 'cart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Easy Order', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cart()),
                    );
                  }),
              StreamBuilder(
                  stream: Firestore.instance
                      .collection("cart")
                      .document("table5")
                      .collection("items")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container();
                    } else {
                      if (snapshot.data.documents.length > 0) {
                        return Positioned(
                          right: 0.0,
                          child: Stack(
                            children: <Widget>[
                              Icon(Icons.brightness_1,
                                  size: 20.0, color: Colors.orange),
                              Positioned(
                                top: 3.0,
                                right: 6.0,
                                child: Text(
                                    snapshot.data.documents.length.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11.0)),
                              )
                            ],
                          ),
                        );
                      }
                      return Container();
                    }
                  }),
            ],
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: DisplayCuisine(),
    );
  }
}
