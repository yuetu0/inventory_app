class ItemModel{
  String name;
  String amount;
  String description;

  ItemModel({this.name, this.amount, this.description});

  factory ItemModel.fromJson(dynamic json){
    return ItemModel(
      name:"${json['Name']}",
      amount:"${json['Amount']}",
      description:"${json['Description']}",
      
    );
  }

  Map toJson() =>{
    "Name" : name,
    "Amount": amount,
    "Description": description
  };
}