import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './../services/cart_services.dart';
import './drawer.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _CartScreen();
  }
}

class _CartScreen extends StatelessWidget {
  final cartService = new CartService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection("cart")
            .document("table5")
            .collection("items")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              appBar: new AppBar(
                title: Text('Cart', style: TextStyle(color: Colors.white)),
                backgroundColor: Theme.of(context).primaryColor,
                centerTitle: false,
              ),
              drawer: CustomDrawer(),
              body: CircularProgressIndicator(
                strokeWidth: 4.0,
              ),
            );
          }
          return Scaffold(
            appBar: new AppBar(
              title: Text('Cart', style: TextStyle(color: Colors.white)),
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: false,
            ),
            drawer: CustomDrawer(),
            body: ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return _buildCartItem(snapshot.data.documents[index]);
              },
            ),
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
                      subtitle: _total(snapshot),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        this.cartService.placeOrder().then((r) {this.showSnackBar(context, "Order Placed..")});
                      },
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
        });
  }

  void showSnackBar(BuildContext context, String text) {
    var snackBar = SnackBar(
      backgroundColor: Color.fromRGBO(85, 139, 47, 1),
      duration: const Duration(seconds: 1),
      content: Text(
        text,
        style: TextStyle(fontSize: 20.0),
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Widget _total(snapshot) {
    double totalPrice = 0;
    for (var i = 0; i < snapshot.data.documents.length; i++) {
      totalPrice += snapshot.data.documents[i].data['price'] *
          snapshot.data.documents[i].data['quantity'];
    }
    return Text(
      "\₹ $totalPrice",
      style: TextStyle(color: Colors.green),
    );
  }

  Widget _buildCartItem(DocumentSnapshot document) {
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
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_drop_up),
                  iconSize: 50.0,
                  onPressed: () {
                    print("Clicked");
                    cartService.increaseQuantity(document.documentID);
                  },
                ),
                Text(document.data['quantity'].toString(),
                    style: TextStyle(fontSize: 40.0, color: Colors.green)),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 50.0,
                  onPressed: () {
                    cartService.decreaseQuantity(document.documentID);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
