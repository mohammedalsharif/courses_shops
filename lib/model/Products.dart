class Products{
  String? name;
  String? price;
  String? imageURL;

  Products({this.name, this.price, this.imageURL});


  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    imageURL=json['imageURL'];
  }
}