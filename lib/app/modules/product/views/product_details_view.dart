import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_integration_practice/app/modules/product/models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel product = Get.arguments;

  ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details ${product.name}'),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Get.toNamed('/cart');
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              product.name,
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 10),
            Text('\$${product.price}', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
