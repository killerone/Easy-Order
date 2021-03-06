import 'package:easy_order/Screens/cart.dart';
import 'package:flutter/material.dart';
import 'DisplayCuisines.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Colors.teal.shade600,
              Colors.teal.shade300
            ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.restaurant,
                    color: Colors.teal.shade600,
                    size: 25.0,
                  ),
                ),
                Text(
                  'Easy Order',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ],
            ),
          ),
          _Custom(Icons.restaurant_menu, 'Menu', ()  {
            Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DisplayCuisine()),
                    );
          }),
          _Custom(
              Icons.shopping_cart,
              'Cart',
              () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Cart()),
                    );
                  }),
        ],
      ),
    );
  }
}

class _Custom extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  _Custom(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.teal.shade600,
          child: Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(text, style: TextStyle(fontSize: 20.0)),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
