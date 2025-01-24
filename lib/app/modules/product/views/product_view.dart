import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_integration_practice/app/modules/product/controllers/product_controller.dart';

class ProductView extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: Obx(() {
        return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              final product = controller.products[index];

              return ListTile(
                title: Text(product.name),
                subtitle: Text('\$${product.price}'),
                onTap: () {
                  Get.toNamed('/product-details', arguments: product);
                },
              );
            });
      }),
    );
  }
}
