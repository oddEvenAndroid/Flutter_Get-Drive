import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import './model/mytrip.dart';
import 'package:http/http.dart' as http;
import 'itemdetail.dart';

void main() => runApp(new MyList());

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  void initState() {
    super.initState();
  }

/**
   * 
   * API Call and get  data
   * 
   */

  Future<List<Trip>> getData() async {
    List<Trip> list;
    String link;

    link = "http://getdrive.in/driver/myTrips?driverId=4";

    var res = await http
        .get(Uri.encodeFull(link), headers: {"Accept": "application/json"});
    // print(res.body);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      var rest = data["driverMyTrips"] as List;
      print(rest);
      list = rest.map<Trip>((json) => Trip.fromJson(json)).toList();
    }
    print("List Size: ${list.length}");
    return list;
  }

  /**
   * 
   * Create Custom Widget For List
   * 
   */

  Widget listViewWidget(List<Trip> article) {
    return Container(
      child: ListView.builder(
          itemCount: article.length,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return Card(
              child: Container(
                height: 120.0,
                width: 120.0,
                child: Center(
                  child: ListTile(
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        '${article[position].trip_unique_id}',
                      ),
                    ),
                    title: Text(
                      '${article[position].trip_start_date}',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () => _onTapItem(context, article[position]),
                  ),
                ),
              ),
            );
          }),
    );
  }

  /**
   * 
   * Create Method for Click event of Item
   * 
   */
  void _onTapItem(BuildContext context, Trip article) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            ItemDetails(article, article.trip_unique_id)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Get Drive'),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listViewWidget(snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    ));
  }
}
