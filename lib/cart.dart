import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
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
              Column(
                children: <Widget>[
                  itemCard('Chicken tikka masala', '248',
                      'asset/images/chickentikka.jpg', 2, 0, context),
                  itemCard('Chicken tikka masala', '248',
                      'asset/images/chickentikka.jpg', 2, 0, context),
                  itemCard('Chicken tikka masala', '248',
                      'asset/images/ChickenTikkaMasala.jpg', 2, 0, context),
                  itemCard('Chicken tikka masala', '248',
                      'asset/images/chickentikka.jpg', 2, 0, context),
                ],
              ),
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

  Widget itemCard(itemName, price, imagePath, quantity, i, context) {
    return InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 3.0,
              child: Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                width: MediaQuery.of(context).size.width - 20,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 5.0),
                    Container(
                      height: 150.0,
                      width: 125.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              // Item image
                              image: AssetImage(imagePath),
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
                              itemName,
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
                              '\₹ $price',
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
        ));
  }
}

void previousScreen() {}
