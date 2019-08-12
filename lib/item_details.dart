import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chicken Tikka Masala")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[ItemImage(), ItemDescription(), AddItemButton()],
        ),
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
      margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 25.0),
      child: Text(
        "Chicken tikka masala is composed of chicken tikka, boneless chunks of chicken marinated in spices and yogurt that are roasted in an oven, served in a creamy curry sauce.",
        style: TextStyle(
            fontSize: 24.0,
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
      margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      width: 300.0,
      height: 50.0,
      child: RaisedButton(
        color: Color.fromRGBO(0, 179, 0, 1),
        child: Text(
          "ORDER",
          style: TextStyle(
              fontSize: 30.0,
              color: Color.fromRGBO(16, 16, 16, 1),
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w700,
              letterSpacing: 3.0),
        ),
        elevation: 7,
        onPressed: () {
          showSnackBar(context);
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  var snackBar = SnackBar(
    content: Text(
      "Added To Order",
      style: TextStyle(fontSize: 20.0),
    ),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}
