import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:login_demo/components/Products.dart';
import 'package:login_demo/components/horizental_listview.dart';
import 'package:login_demo/screens/profile.dart';
import 'package:login_demo/screens/search.dart';

class DrawerScreen extends StatefulWidget {
  static const routeName = "/home";

  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
//    === IMAGE CAROUSEL ===
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage("Assets/Images/amqezi.jpg"),
          AssetImage("Assets/Images/image.jpg"),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        dotColor: Colors.white,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 8.0,
      ),
    );

//    === ENTIRE APP ===

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Home" , style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => new SearchScreen()));
          }),
          new IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Profile()));
              }),
        ],
      ),
//      backgroundColor: const Color(0x99D19C),
      backgroundColor: Colors.white,
      drawer: new Drawer(
        child: Container(
          color: Colors.grey[700],
          child: new ListView(
            children: <Widget>[
              //header
              new UserAccountsDrawerHeader(
                accountName: Text("Nirvana"),
                accountEmail: Text("Nirvananaseri7@gmail.com"),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: new BoxDecoration(color: Colors.deepOrangeAccent),
              ),
              //body
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new DrawerScreen()));
                },
                child: ListTile(
                  title: Text("Create WorkHub",style: TextStyle(color: Colors.white),),
                  leading: Icon(
                    Icons.library_add,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => new Profile()));
                },
                child: ListTile(
                  title: Text("Favorites" , style: TextStyle(color: Colors.white),),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("My WorkHubs", style: TextStyle(color: Colors.white),),
                  leading: Icon(
                    Icons.format_line_spacing,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Hoy Trends", style: TextStyle(color: Colors.white),),
                  leading: Icon(
                    Icons.trending_up,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              Divider(color: Colors.white,),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Settings", style: TextStyle(color: Colors.white),),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("About", style: TextStyle(color: Colors.white),),
                  leading: Icon(
                    Icons.help,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //image carsouel
          image_carousel,
          //padding widget
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Text("Categories",style: TextStyle(color: Colors.blueAccent),),
          ),
          //horizon listview
          HorizontalList(),

          new Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0),
            child: new Text("Recent WorkShops",style: TextStyle(color: Colors.blueAccent),),
          ),

          //grid View
          Container(
            height: 320.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}
