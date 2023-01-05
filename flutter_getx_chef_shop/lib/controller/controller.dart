
import 'package:flutter_getx_chef_shop/data/services.dart';
import 'package:flutter_getx_chef_shop/model/product_model.dart';
import 'package:get/get.dart';


class Controller extends GetxController {

  var productList = <Product>[].obs;
  var cartList = <Product>[].obs;
  int get count => cartList.length;

  @override
  void onInit() {
    super.onInit();
    // fetchData();
  }

  void addToItem(Product product) {
    cartList.add(product);
    for (var o in cartList) {
      print(o.name);
    }
  }

  Future<List<Product>?> fetchData() async {
    var products = await Services.fetchProducts();
    if (products != null) {
      productList.value = products;
      return productList;
    } else {
      return null;
    }
  }
}