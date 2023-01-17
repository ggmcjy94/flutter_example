import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart_app/components/shoppingcart_detail.dart';
import 'package:flutter_shoppingcart_app/components/shoppingcart_header.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildShoppingCartAppBar(),
      body: Column(
        children: [
          ShoppingCartHeader(),
          ShoppingCartDetail(),
        ],
      ),
    );
  }

  AppBar _buildShoppingCartAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: (){},
      ),
      actions: [
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.shopping_cart),
        ),
        const SizedBox(width: 16,)
      ],
      elevation: 0.0,
    );
  }
}
