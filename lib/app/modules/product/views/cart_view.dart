import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_integration_practice/app/modules/product/controllers/cart_controller.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(child: Obx(() {
            return ListView.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                final item = cartController.cartItems[index];

                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('\$${item.price.toString()}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      cartController.removeFromCart(item);
                    },
                  ),
                );
              },
            );
          })),
          Obx(() {
            return Padding(
              padding: EdgeInsets.all(16.00),
              child: Text(
                'Total: \$${cartController.totalAmount.value.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 24),
              ),
            );
          })
        ],
      ),
    );
  }
}
