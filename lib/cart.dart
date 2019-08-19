import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                previousScreen();
              }),
        ),
        body: Column(
          children: <Widget>[Cards(),Cards()],
        ));
  }

  
}

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album),
          title: Text('The Enchanted Nightingale'),
          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
        )
      ]),
      borderOnForeground: true,
      color: Colors.orange,
      margin: EdgeInsets.fromLTRB(7.0, 10.0, 7.0, 0.0),
    );
  }
}

void previousScreen() {}