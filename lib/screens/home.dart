import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.blue,
       title: Text('Home'),
       centerTitle:true,
     ),
    body: Container(
      child: Row(
        children: <Widget> [
          RaisedButton(
            onPressed: null,
            child:Text('All Items'),
            ),
          RaisedButton(
            onPressed: null,
            child: Text ('Add Item')
            )
        ],
        )
      )
    );
  }
}