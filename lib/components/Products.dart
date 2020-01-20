import 'package:flutter/material.dart';
import 'package:login_demo/screens/products_daatails.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
    {
      'name': "FUCK",
      'picture': "Assets/Images/pass.png",
      "old_price": "120",
      "price": "180",
    },
    {
      'name': "My ass2",
      'picture': "Assets/Images/login.png",
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
          return Single_Product(
            product_name: productList[index]["name"],
            product_pic: productList[index]["picture"],
            product_old: productList[index]["old_price"],
            product_price: productList[index]["price"],
          );
        });
  }
}

class Single_Product extends StatelessWidget {
  final product_name;
  final product_pic;
  final product_old;
  final product_price;

  Single_Product({
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
              onTap: () =>
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) =>
                      new ProductDetails(
                        //passing the values of the product to the product details page
                        product_detail_name: product_name,
                        product_detail_old_price: product_old,
                        product_detail_pic: product_pic,
                        product_detail_price: product_price,
                      ))),
//              child: ClipRRect(
//                borderRadius: BorderRadius.circular(20.0),
//                child: GridTile(
//                    footer: Container(
//                      color: Colors.white38,
//                      child: ListTile(
//                        leading: Text(
//                          product_name,
//                          style: TextStyle(fontWeight: FontWeight.bold),
//                        ),
//                        title: Text(
//                          "\$$product_price",
//                          style: TextStyle(
//                              color: Colors.red, fontWeight: FontWeight.w800),
//                        ),
//                        subtitle: Text(
//                          "\$$product_old",
//                          style: TextStyle(
//                              color: Colors.black45,
//                              fontWeight: FontWeight.w800,
//                              decoration: TextDecoration.lineThrough),
//                        ),
//                      ),
////                    child: new Row(
////                      children: <Widget>[
////                        Expanded(child: new Text(product_name),),
////                        new Text()
////                      ],
////                    ),
//                    ),
//                    child: Image.asset(
//                      product_pic,
//                      fit: BoxFit.cover,
//                    )),
//              ),
              child: ClipRRect(
                //force to shape like sth
                borderRadius: BorderRadius.circular(10.0),
                child: GridTile(
                  child: GestureDetector(
                    onTap: () {
//                      Navigator.of(context).pushNamed(
//                        WorkshopDetail.routName,
//                        arguments: title,
//                      );
                    },
//                    child: Image.network(
//                      imageUrl,
//                      fit: BoxFit.cover,
//                    ),
                  ),
                  footer: GridTileBar(
                    backgroundColor: Colors.black87,
                    leading: IconButton(
                        icon: Icon(Icons.favorite_border),
                        color: Theme
                            .of(context)
                            .accentColor,
                        onPressed: () {}),
//                    title: Text(
//                    ,
//                    textAlign: TextAlign.center,
//                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.bookmark_border),
                        color: Theme
                            .of(context)
                            .accentColor,
                        onPressed: () {}),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
