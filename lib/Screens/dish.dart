import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './drawer.dart';
import './../services/cart_services.dart';

class Dish extends StatefulWidget {
  String id;

  Dish({this.id});
  @override
  _DishState createState() => _DishState(this.id);
}

class _DishState extends State<Dish> {
  final id;
  _DishState(this.id);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection('dish').document(id).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator(
              strokeWidth: 4.0,
            );
          }
          return Scaffold(
            drawer: CustomDrawer(),
            body: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 350.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      NetworkImage(snapshot.data['imagePath']),
                                  fit: BoxFit.cover)),
                        ),
                        // Padding(
                        //     padding: EdgeInsets.only(right: 15.0),
                        //     child: IconButton(
                        //       icon: Icon(Icons.arrow_back),
                        //       color: Colors.black,
                        //       onPressed: () {},
                        //     ))
                      ],
                    ),
                    SizedBox(height: 20.0),

                    // Item name and price
                    Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Text(
                                snapshot.data['name'],
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 25.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              '\₹ ' + snapshot.data['price'].toString(),
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 25.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    SizedBox(height: 20.0),

                    //Item Description
                    Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: ItemDescription(snapshot.data['description']))
                  ],
                )
              ],
            ),

            // Order Button
            bottomNavigationBar: Material(
              elevation: 7.0,
              color: Colors.white,
              child: AddItemButton(
                  snapshot.data.documentID,
                  snapshot.data['imagePath'],
                  snapshot.data['name'],
                  snapshot.data['price']),
            ),
          );
        });
  }
}

class ItemDescription extends StatelessWidget {
  String description;

  ItemDescription(String description) {
    this.description = description;
    print(description);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        this.description,
        style: TextStyle(
            fontSize: 18.0,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            letterSpacing: 1.1),
      ),
    );
  }
}

class AddItemButton extends StatelessWidget {
  final id;
  final imagePath;
  final name;
  final price;

  final cart_service = new CartService();
  AddItemButton(this.id, this.imagePath, this.name, this.price);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
      width: 300.0,
      height: 50.0,
      child: RaisedButton(
        color: Color.fromRGBO(161, 221, 112, 1),
        child: Text(
          "ORDER",
          style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w700,
              letterSpacing: 3.0),
        ),
        elevation: 7,
        onPressed: () {
          cart_service
              .addToCart(id, name, imagePath, price)
              .then((data) => showSnackBar(context, "Added to cart"));
        },
      ),
    );
  }
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

void previousScreen(BuildContext context) {
  showSnackBar(context, 'Previous Page');
}

Future<bool> customizeDialog(context) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    "Customize",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontFamily: "Montserrat",
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                customizeOptions(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                      color: Color.fromRGBO(161, 221, 112, 1),
                      child: Text(
                        "Apply",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontFamily: "Montserrat",
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {}),
                )
              ],
            ),
            // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          ),
        );
      });
}

Widget customizeOptions() {
  return Container(
    height: 350.0,
    width: 200.0,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("Hello World"),
          Text("1234568"),
        ],
      ),
    ),
  );
}
