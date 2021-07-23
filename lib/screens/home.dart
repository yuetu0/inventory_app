import 'package:flutter/material.dart';
import 'dart:developer' as logger;

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
       title: Text('Inventory App'),
       centerTitle:true,
     ),
    body: Center(
      child: Column(
        //allignment for row still need to edit 
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //buttons
        
        children: <Widget> [
         
          //container 1
          new Container(
            width: 150.0,
            height: 150.0,
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
            //onpressed leads to other 
            onPressed: (){
              Navigator.of(context).pushNamed('/allitems');
              logger.log("hello");
            },
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(
                   padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.construction_rounded , color: Colors.white,),
                ),
                Text("All Items")
              ]
            )
          )),
       
          new Container(
            height:150.0,
            width: 150.0,

          child: RaisedButton(
          
             textColor: Colors.white,
            color: Colors.blue,
            onPressed: (){},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Icon(Icons.add, color:Colors.white),
                  ),
                  Text("Add Items"),
              ],
        )
          )),
          ],
          ),
        )
        );
          }}