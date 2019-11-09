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

  navigateToItems(String name) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dish(id: name)));
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
      ),
      drawer: CustomDrawer(),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('dish')
            .where("cuisine", isEqualTo: cuisine)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text('Loading Data ...... Please wait');
          return ListView(
            scrollDirection: Axis.vertical,
            children: snapshot.data.documents.map((document) {
              return Card(
                child: ListTile(
                  leading: Image.network(
                    document.data['imagePath'],
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.fitHeight,
                  ),
                  title: Text(document.data['name']),
                  subtitle: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topRight,
                        child: Text("\$₹ {document.data['price']}"),
                      )
                    ],
                  ),
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
