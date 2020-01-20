import 'dart:io';

import 'package:flutter/material.dart';
import 'package:login_demo/screens/home_screen.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_price;
  final product_detail_pic;
  final product_detail_old_price;

  //Constructor
  ProductDetails({
    this.product_detail_name,
    this.product_detail_old_price,
    this.product_detail_pic,
    this.product_detail_price,
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: InkWell(
          child: Text(widget.product_detail_name),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new HomeScreen()));
          },
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: null),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_pic),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                        "${widget.product_detail_old_price}",
                      )),
                      Expanded(
                          child: new Text("${widget.product_detail_price}")),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //the first button
          Row(
            children: <Widget>[
              //the size button
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Time"),
                          content: new Text("Choose the damn time"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("Close"),
                              color: Colors.blue,
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Time")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ],
                ),
              )),

              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Time"),
                          content: new Text("Choose the damn time"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("Close"),
                              color: Colors.blue,
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Sesion")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ],
                ),
              )),

              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: new Text("Time"),
                          content: new Text("Choose the damn time"),
                          actions: <Widget>[
                            new MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: new Text("Close"),
                              color: Colors.blue,
                            ),
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(child: new Text("Grader")),
                    Expanded(child: new Icon(Icons.arrow_drop_down)),
                  ],
                ),
              )),
            ],
          ),

          //the second buttons

          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                color: Colors.red,
                textColor: Colors.white,
                elevation: 0.2,
                child: new Text("Sabte nam now"),
              )),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                  onPressed: null),
              new IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: null)
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new ListTile(
              title: new Text("WorkShop Details"),
              subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              ),
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "WorkShop name ",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Similar ProDucts"),
          ),
          //SIMILAR PRODUCTS SEARCH
          Container(
            height: 210.0,
            child: Similar_products(),
          ),
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var productList = [
    {
      'name': "Blazzer",
      'picture': "Assets/Images/morty.jpeg",
      "old_price": "120",
      "price": "180",
    },
    {
      'name': "My ass",
      'picture': "Assets/Images/idk.png",
      "old_price": "100",
      "price": "50",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_Product(
            product_name: productList[index]["name"],
            product_pic: productList[index]["picture"],
            product_old: productList[index]["old_price"],
            product_price: productList[index]["price"],
          );
        });
  }
}

class Similar_Single_Product extends StatelessWidget {
  final product_name;
  final product_pic;
  final product_old;
  final product_price;

  Similar_Single_Product({
    this.product_name,
    this.product_old,
    this.product_pic,
    this.product_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: product_name,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                        //passing the values of the product to the product details page
                        product_detail_name: product_name,
                        product_detail_old_price: product_old,
                        product_detail_pic: product_pic,
                        product_detail_price: product_price,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
//                    child: ListTile(
//                      leading: Text(
//                        product_name,
//                        style: TextStyle(fontWeight: FontWeight.bold),
//                      ),
//                      title: Text(
//                        "\$$product_price",
//                        style: TextStyle(
//                            color: Colors.red, fontWeight: FontWeight.w800),
//                      ),
//                      subtitle: Text(
//                        "\$$product_old",
//                        style: TextStyle(
//                            color: Colors.black45,
//                            fontWeight: FontWeight.w800,
//                            decoration: TextDecoration.lineThrough),
//                      ),
//                    ),
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: new Text(product_name),
                        ),
                        new Text("prod price "),
                      ],
                    ),
                  ),
                  child: Image.asset(
                    product_pic,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
