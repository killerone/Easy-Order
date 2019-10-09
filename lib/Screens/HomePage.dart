import 'package:flutter/material.dart';
import 'DisplayCuisines.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()  => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  Route route = MaterialPageRoute(builder: (context) => DisplayCuisine());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text('Easy Order',style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,), onPressed: (){})
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Colors.green.shade600,
                  Colors.green.shade300
                ])
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.restaurant,
                      color: Colors.green.shade600,
                      size: 25.0,
                    ),
                  ),
                  Text('Easy Order',style: TextStyle(fontSize: 25,color:Colors.white),),
                ],
              ),
            ),
            custom(Icons.restaurant_menu,'Menu',() =>Navigator.pushReplacement(context, route)),
            custom(Icons.shopping_cart,'Cart',()=>{}),
          ],
        ),
      ),
    );
  }
}

class custom extends StatelessWidget{
  IconData icon;
  String text;
  Function onTap;
  custom(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
    child: Container(
      decoration: BoxDecoration(
        border: Border(bottom:BorderSide(color:Colors.grey.shade400))
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.lightGreenAccent,
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
                    child: Text(text,style: TextStyle(fontSize: 20.0)),
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