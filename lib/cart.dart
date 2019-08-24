import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
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
                                  image:
                                      AssetImage('asset/images/green_bg.png'),
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
                        Positioned(
                          top: 250.0,
                          child: Column(
                            children: <Widget>[
                              itemCard('Finn Navian-Sofa', '248',
                                  'asset/images/green_bg.png', 2, 0, context),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
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
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.5)),
                        ),
                        SizedBox(width: 10.0),
                        Container(
                          height: 150.0,
                          width: 125.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imagePath),
                                  fit: BoxFit.contain)),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  itemName,
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 7.0,
                            ),
                            Text(
                              '\₹ 350',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 25.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )),
        ));
  }
}

void previousScreen() {}
