import 'package:flutter/material.dart';
import './model/mytrip.dart';

class ItemDetails extends StatefulWidget {
  final Trip article;
  final String trip_unique_id;

  ItemDetails(this.article, this.trip_unique_id);
  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.trip_unique_id),
      ),
      body: Column(
        children: <Widget>[
          Text("Start Date  :  " + widget.article.trip_start_date),
          Text("Unique ID   :  " + widget.article.trip_unique_id),
        ],
      ),
    );
  }
}
