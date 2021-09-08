import 'package:flutter/material.dart';
import 'package:inventory_app/screens/home.dart';
import 'package:inventory_app/screens/allitems.dart';
import 'package:inventory_app/screens/additems.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes:{
      '/home':(context)=> Home(),
      '/allitems':(context)=>AllItems(),
      '/additems':(context)=>AddItems(),
    }
  ));
}

