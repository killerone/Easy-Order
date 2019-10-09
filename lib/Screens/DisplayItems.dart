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
            scrollDirection: Axis.vertical,
            children: snapshot.data.documents.map((document) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    title: Container(
                      height: 180.0,
                      width: 200.0,
                      child: Image.network(document['imagePath'],fit:BoxFit.fitWidth),
                    ),
                    subtitle: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Text(document['name'], textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.green.shade600),),
                        )
                      ],
                    ),
                    onTap: () => navigateToItems(document['name'].toString()),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
