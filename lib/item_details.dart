import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  @override
  /* Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chicken Tikka Masala"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              previousScreen(context);
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[ItemImage(), ItemDescription(), AddItemButton()],
        ),
      ),
    );
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
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
                            image: AssetImage('asset/images/chickentikka.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            color: Colors.black,
                            onPressed: () {},
                          )
                        ],
                      ))
                ],
              ),
              SizedBox(height: 20.0),
              Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'Chicken Tikka Masala',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 25.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
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
                  )),
              SizedBox(height: 20.0),
              Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: ItemDescription())
            ],
          )
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 7.0,
        color: Colors.white,
        child: AddItemButton(),
      ),
    );
  }
}

class ItemImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('asset/images/ChickenTikkaMasala.jpg');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
    );
  }
}

class ItemDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        "Chicken tikka masala is composed of chicken tikka, boneless chunks of chicken marinated in spices and yogurt that are roasted in an oven, served in a creamy curry sauce.",
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
          showSnackBar(context, 'Added to Order');
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
