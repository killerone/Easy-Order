import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './services/cart_services.dart';

class Cart extends StatefulWidget {
  @override
  _Cart createState() => _Cart();
}

class _Cart extends State<Cart> {
  Widget _buildCartItem(BuildContext context, DocumentSnapshot document) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          borderRadius: BorderRadius.circular(10.0),
          elevation: 3.0,
          child: Container(
            margin: EdgeInsets.only(bottom: 10.0),
            // height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: <Widget>[
                // SizedBox(width: 5.0),
                Container(
                  height: 550.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          // Item image
                          image: NetworkImage(document['imagePath']),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          // Item name
                          document['name'],
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    // Item price
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          '\₹ ' + document["price"].toString(),
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        // Row(
                        //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: <Widget>[
                        //     Container(
                        //       decoration: BoxDecoration(
                        //           color: Colors.grey.withOpacity(0.4)),
                        //       child: Text("+"),
                        //     )
                        //   ],
                        // )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 150.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('asset/images/green_bg.png'),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.black,
                        onPressed: () {},
                      )),
                  Positioned(
                    top: 65.0,
                    left: 20.0,
                    child: Text(
                      "My Cart",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 30.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              StreamBuilder(
                  stream: Firestore.instance
                      .collection("cart")
                      .document("table5")
                      .collection("items")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const Text("Loading..");
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemExtent: 80.0,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) => _buildCartItem(
                          context, snapshot.data.documents[index]),
                    );
                  })
            ],
          )
        ],
      )),
      bottomNavigationBar: Material(
        color: Colors.grey.withOpacity(0.2),
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  'Total : \₹ 1000',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: RaisedButton(
                  elevation: 0.5,
                  onPressed: () {},
                  color: Colors.orange.withOpacity(0.7),
                  child: Text(
                    "Place Order",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        color: Colors.white,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void previousScreen() {}
