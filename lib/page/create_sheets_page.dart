import '/model/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/api/sheets/item_sheets_api.dart';
import 'package:inventory_app/model/item.dart';
import '/widget/button_widget.dart';
import 'package:gsheets/src/gsheets.dart';
import 'package:gsheets/gsheets.dart';

class CreateSheetsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Inventory App"),
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(32),
          child: ButtonWidget(
            text: 'Save',
            onClicked: () async {
              final item = {
                ItemFields.amount: '105',
                ItemFields.name: "nails",
                ItemFields.description: "silver",
              };
              await ItemSheetsApi.insert([item]);
            },
          )));
}
