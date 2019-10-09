import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_order/Screens/dish.dart';
import 'package:easy_order/Screens/drawer.dart';
import 'package:flutter/material.dart';

class DisplayItems extends StatefulWidget {
  final String cuisine;

  DisplayItems({this.cuisine});
  @override
  _DisplayItemsState createState() => _DisplayItemsState(this.cuisine);
}

class _DisplayItemsState extends State<DisplayItems> {
  final cuisine;
  _DisplayItemsState(this.cuisine);

  navigateToItems(String name){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Dish(id:name)));
  }

  navigateToCart() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'Cuisines',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),drawer: CustomDrawer(),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('dish')
            .where("cuisine", isEqualTo: cuisine)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text('Loading Data ...... Please wait');
          return ListView(
            children: snapshot.data.documents.map((document) {
              return Container(
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Container(
                        child: Image.network(document['imagePath']),
                        height:180.0,
                        ),
                    ],
                  ),
                  subtitle: Text(document['name']),
                  onTap: () => navigateToItems(document.documentID.toString()),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
