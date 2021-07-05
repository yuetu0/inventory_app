import 'package:flutter/material.dart';
import 'package:inventory_app/screens/home.dart';
import 'package:inventory_app/screens/allitems.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes:{
      '/home':(context)=> Home(),
      '/allitems':(context)=>AllItems(),
    }
  ));
}

