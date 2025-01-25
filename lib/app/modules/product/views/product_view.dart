import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_integration_practice/app/modules/product/controllers/cart_controller.dart';

import '../controllers/product_controller.dart';

class ProductView extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());

  ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Products"),
          backgroundColor: Colors.lightBlueAccent,
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Get.toNamed('/cart');
                })
          ]),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    SizedBox(height: 30);
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: controller.getBackgroundColor(index),
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withValues(alpha: 0.5), // Shadow color
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3), // Shadow position
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text(product.name),
                              subtitle: Text('\$${product.price}'),
                              onTap: () {
                                Get.toNamed('/product-details',
                                    arguments: product);
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      if (product.quantity > 0) {
                                        product.quantity.value =
                                            (product.quantity - 1).value;
                                        cartController.removeFromCart(product);
                                      } else {
                                        product.quantity.value = 0;
                                      }
                                    },
                                    icon: Icon(Icons.remove)),
                                Obx(() {
                                  return Container(
                                    width: 45,
                                    height: 35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Text('${product.quantity}'),
                                  );
                                }),
                                IconButton(
                                    onPressed: () {
                                      product.quantity.value =
                                          (product.quantity + 1).value;
                                      cartController.addToCart(product);
                                    },
                                    icon: Icon(Icons.add)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }),
          ),
          Container(
              height: 55,
              width: 450,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(8)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8), // Match the Container's border radius
                  ),
                ),
                onPressed: () {
                  Get.toNamed('/cart_view', arguments: controller.products);
                },
                child: Text(
                  'Check Out',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ))
        ],
      ),
    );
  }
}
