class ItemModel{
  String picture;
  String name;
  String amount;

  ItemModel({this.picture, this.name, this.amount});

  factory ItemModel.fromJson(dynamic json){
    return ItemModel(
      picture:"${json['Picture']}",
      name:"${json['Name']}",
      amount:"${json['Amount']}",
      
    );
  }

  Map toJson() =>{
    "Picture" : picture,
    "Name": name,
    "Amount": amount
  };
}