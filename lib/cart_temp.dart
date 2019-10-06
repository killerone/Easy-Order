import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Cart', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: false,
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection("cart")
              .document("table5")
              .collection("items")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Text("Loading....");
            else
              return _CartProduct(snapshot);
          }),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text(
                  "Total:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("\₹ 1000"),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "PLACE ORDER",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                      wordSpacing: 2.0),
                ),
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CartProduct extends StatefulWidget {
  final snapshot;
  _CartProduct(this.snapshot);
  @override
  _CartProductState createState() => _CartProductState(this.snapshot);
}

class _CartProductState extends State<_CartProduct> {
  final snapshot;
  _CartProductState(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data.documents.length,
      itemBuilder: (context, index) {
        return _buildCartItem(snapshot.data.documents[index]);
      },
    );
  }

  Widget _buildCartItem(document) {
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
              alignment: Alignment.bottomLeft,
              child: Text("\$${document.data['price']}"),
            )
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Container(
            width: 20,
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_drop_up),
                  onPressed: () {},
                ),
                Text(document.data['quantity'].toString()),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
