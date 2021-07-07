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
      child: Column(
        //allignment for row still need to edit 
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        //buttons
        children: <Widget> [
          RaisedButton(
            //onpressed leads to other 
            onPressed: (){
              Navigator.of(context).pushNamed('/allitems');
            },
            child:Text('All Items'),
            ),
          RaisedButton(
            onPressed: (){},
            child: Text ('Add Item')
            )
        ],
        )
      )
    );
  }
}