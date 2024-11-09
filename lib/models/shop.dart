import 'package:flutter/cupertino.dart';
import 'package:tod/models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    //product 1
    Product(
        name: "Product  1",
        description:
            "Item Descriptions...This more Desscription about the Products which you gonna buy",
        price: 99.0,
    imagePath: 'assets/glasses.png'
    ), //product 2
    Product(
        name: "Product  2",
        description:
            "Item Descriptions...This more Desscription about the Products which you gonna buy",
        price: 99.0,
        imagePath: 'assets/watch.png'
    ), //product 3
    Product(
        name: "Product  3",
        description:
            "Item Descriptions...This more Desscription about the Products which you gonna buy",
        price: 99.0,
        imagePath: 'assets/shoes.png'
    ), //product 5
    Product(
        name: "Product  4",
        description:
            "Item Descriptions...This more Desscription about the Products which you gonna buy",
        price: 99.0,
        imagePath: 'assets/hoodie.png'
    )
  ];

  //user cart
  List<Product> _cart = [];
  //get prodcts list
  List<Product> get shop => _shop;
  //Get user Cart
  List<Product> get cart => _cart;
  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove cart from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
