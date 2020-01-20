import 'package:flutter/material.dart';
import 'package:login_demo/screens/products_daatails.dart';

class Profile_details extends StatefulWidget {
  @override
  _Profile_detailsState createState() => _Profile_detailsState();
}

class _Profile_detailsState extends State<Profile_details> {
  var Workshops_taken = [
    {
      'name': "FUCK",
      'picture': "Assets/Images/amqezi2.jpg",
    },
    {
      'name': "My ass2",
      'picture': "Assets/Images/login.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Workshops_taken.length,
        itemBuilder: (context, index) {
          return new Single_workshop(
            workshop_name: Workshops_taken[index]["name"],
            workshop_pic: Workshops_taken[index]["picture"],
          );
        });
  }
}

class Single_workshop extends StatelessWidget {
  final workshop_name;

  final workshop_pic;

  Single_workshop({
    this.workshop_name,
    this.workshop_pic,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//          ==== LEADING ====
        leading: Image.asset(workshop_pic),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetails(
                        product_detail_name: workshop_name,
                        product_detail_pic: workshop_pic,
                      )));
        },
//        ==== TITLE ====
        title: new Text(workshop_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Expanded(child: new Text("saaat:")),
                Expanded(child: new Text("days:")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
