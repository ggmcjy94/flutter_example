import 'package:flutter/material.dart';
import 'package:flutter_getx_chef_shop/model/product_model.dart';
import '../controller/controller.dart';
import 'package:flutter_getx_chef_shop/view/product_tile.dart';
import 'package:get/get.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chef Shop'),
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.view_list_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: FutureBuilder<List<Product>?>(
              future: controller.fetchData(),
              builder: (context, snapshop) {
                if (snapshop.hasData) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return ProductTile(
                          controller.productList[index], controller);
                    },
                    itemCount: controller.productList.length,
                  );
                }
                return Center(child: CircularProgressIndicator());
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<Controller>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: TextStyle(
              fontSize: 20,
            ),
          );
        }),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
