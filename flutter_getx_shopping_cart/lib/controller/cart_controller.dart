

import 'package:flutter_getx_shopping_cart/model/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  double get totalPrice => cartItems.fold(0, (e, item) => e+item.price);
  int get count => cartItems.length;


  void addToItem(Product product) {
    cartItems.add(product);
  }
}