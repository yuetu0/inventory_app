import 'package:flutter/material.dart';

class AllItems extends StatefulWidget {

  @override
  _AllItemsState createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  getItemFromSheet(){
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title : Text("All Items"),
        centerTitle : true,
      ),
      body:Container(

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: (){},
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final String picture;
  final String name;
  final String amount;
  
  ItemTile ({this.picture, this.name, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(children: [
          Image.network(picture),
        ],) 
        ],
      ),
    );
  }
}