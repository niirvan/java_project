import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_demo/components/Products.dart';
import 'package:login_demo/components/horizental_listview.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<SearchScreen> {
  final cities = ["SHiraz ", "Tehran", "Terrry"];
  final recentCities = ["Shiraz"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Explore"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: DataSearch(cities, recentCities));
              })
        ],
      ),
      body: new ListView(
        children: <Widget>[
          //grid View
          Container(
            height: 600.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  //provider
  final List<String> cities;
  final List<String> recentCities;

  DataSearch(this.cities, this.recentCities);

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for appbar

    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            //x icon
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading of the left
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          //back arrow
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results based on selection
    recentCities.add(query);
    return Container(
      height: 100.0,
      width: 100.0,
      child: Card(
        color: Colors.red,
        shape: StadiumBorder(),
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // suggestion
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                query = suggestionList[index];
                showResults(context);
              },
              leading: Icon(Icons.location_city),
              title: RichText(
                text: TextSpan(
                    text: suggestionList[index].substring(0, query.length),
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: suggestionList[index].substring(query.length),
                          style: TextStyle(color: Colors.grey)),
                    ]),
              ),
            ),
        itemCount: suggestionList.length);
  }
}
