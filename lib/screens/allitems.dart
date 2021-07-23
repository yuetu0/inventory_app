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
    var raw = await http.get(Uri.parse("https://script.google.com/macros/s/AKfycbyDC3ph7ka5GmzRs7t-aZGDHove1veyspYk7bqXLUKFkkCB2Dy7/exec"));
    var jsonItem = convert.jsonDecode(raw.body);
    //print('this is the $jsonItem');
    //items = jsonItem.map((json) => ItemModel.fromJSON(json));

    jsonItem.forEach((element){
      debugPrint('$element THIS IS NEXT>>>>>>>');
      ItemModel itemModel = new ItemModel();
      itemModel.picture = element['Picture'];
      itemModel.name = element['Name'];
      itemModel.amount = element['Amount'];

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
              picture: items[index].picture,
              name : items[index].name,
              amount: items[index].amount,
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
  final String picture, name, amount;
  
  ItemTile ({this.picture, this.name, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
        Row(children: [Image.network(picture)],

        ) 
        ],
      ),
    );
  }
}