import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as logger;
import 'package:http/http.dart' as http;
import 'package:inventory_app/db/database_helper.dart';
import 'dart:convert' as convert;
import 'dart:async';

class AllItems extends StatefulWidget {

  @override
  _AllItemsState createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {

  List<ItemModel> items = List<ItemModel>();
  getItemFromSheet() async {
      //Uri.https('script.google.com', '/macros/s/AKfycbyRF-QWg2Dh85KOrldzUGghmph9Ose0qEABG4FPhe4QFQ2MuElv/exec', {'q': '{http}'});
    var raw = await http.get(Uri.parse("https://script.google.com/macros/s/AKfycbzqYAGjj5tD1ZUhPdugDR6-dCiQ16iFA7lo66JXW9esSgTa57Pv/exec"));
    var jsonItem = convert.jsonDecode(raw.body);
    //print('this is the $jsonItem');
    //items = jsonItem.map((json) => ItemModel.fromJSON(json));

    jsonItem.forEach((element){
      debugPrint('$element THIS IS NEXT>>>>>>>');
      ItemModel itemModel = new ItemModel();
      itemModel.name = element['Name'];
      itemModel.amount = element['Amount'];
      itemModel.description = element['Description'];

      items.add(itemModel);
    });

  }

  @override
  void initState() {
    getItemFromSheet();
    super.initState();
    logger.log('init state');
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
        child:ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index){
            return ItemTile(
              name: items[index].name,
              amount : items[index].amount,
              description: items[index].description,
            );
          },
        )
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
  final String name, amount, description;
  
  ItemTile ({this.name, this.amount, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
        Container(

          child: Row(children: [
            Text(name),
            Text(amount),
          ],)
        ) 
        ],
      ),
    );
  }
}