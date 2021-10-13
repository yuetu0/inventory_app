import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_app/page/create_sheets_page.dart';
import '/api/sheets/item_sheets_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ItemSheetsApi.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = "Robotics Inventory";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Inventory App"),
        centerTitle: true,
      ),
    );
  }
}
