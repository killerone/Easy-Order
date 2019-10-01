import 'package:easy_order/item_details.dart';
import 'package:easy_order/cart.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // addInCart();
    return MaterialApp(
        title: 'Easy Order',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(primaryColor: Color.fromRGBO(85, 139, 47, 1)),
        theme: ThemeData(primaryColor: Color.fromRGBO(124, 179, 66, 1)),
        home: Dish());
  }

  void addInCart() {
    Firestore.instance.collection("cart").document().setData({"tbNumber": 123});
    Firestore.instance
        .collection("cart")
        .where("tbNumber", isEqualTo: 123)
        .snapshots()
        .listen((data) {
//      print(data.do);
    });
  }
}

/*class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document){
    return ListTile(
      title: Row(
        children:[
          Expanded(
            child: Text(
              document['name'],
              style:Theme.of(context).textTheme.headline,
            ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xffddddff),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Text(
                document['votes'].toString(),
                style:Theme.of(context).textTheme.display1
              )
            )
        ],
      ),
      onTap:(){
        print("Should increase votes here.");
      }
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection('bandnames').snapshots(),
          builder: (context,snapshot){
            if (!snapshot.hasData) return const Text('Loading...123');
            return ListView.builder(
              itemExtent:  80.0,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context,index) => 
                _buildListItem(context, snapshot.data.documents[index]),
            );
          }
          // ListView.builder(
          // itemExtent: 80.0,
             
          // ),
        )
      );
  }
}
*/
