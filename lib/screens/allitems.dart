import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:inventory_app/model/form.dart';
import 'dart:convert' as convert;

class AllItems extends StatefulWidget {

  @override
  _AllItemsState createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.blue,
       title: Text('Inventory App'),
       centerTitle:true,
     ),);
  }

 

  }
