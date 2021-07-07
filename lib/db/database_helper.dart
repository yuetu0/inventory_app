class Item{
  final int amount;
  final String name;
  Item({this.amount, this.name});
}


class DatabaseHelper{

static final _databaseName = "items.db";
static final _databaseVersion = 1; 

DatabaseHelper._privateConstructor();
 static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
}