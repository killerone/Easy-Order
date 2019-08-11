import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chicken Tikka Masala")),
      body: Column(
        children: <Widget>[
          ItemImage(),
          ItemDescription(),
        ],
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
      margin: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      child: Text(
        "Chicken tikka masala is composed of chicken tikka, boneless chunks of chicken marinated in spices and yogurt that are roasted in an oven, served in a creamy curry sauce.",
        style: TextStyle(
            fontSize: 23.0,
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.w400,
            letterSpacing: 1.1),
      ),
    );
  }
}

/*
Align(
        //   alignment: Alignment.centerLeft,
        //   child: Text(
        //     "Description",
        //     textAlign: TextAlign.start,
        //     textDirection: TextDirection.ltr,
        //     style: TextStyle(
        //         fontSize: 40.0,
        //         fontFamily: 'Ubuntu',
        //         fontWeight: FontWeight.w700,
        //         color: Color.fromRGBO(56, 56, 56, 1),
        //         letterSpacing: 1.5),
        //   ),
        // ),*/
