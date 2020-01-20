import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//should be imported to the main

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
              image_location: "Assets/Images/shirt.png", image_caption: "Same"),
          Category(
              image_location: "Assets/Images/shirt.png", image_caption: "shit"),
          Category(
              image_location: "Assets/Images/shirt.png",
              image_caption: "different"),
          Category(
              image_location: "Assets/Images/shirt.png", image_caption: "day"),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  //give this little bastard a constructor
  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(
                image_caption,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
