import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api_integration_practice/app/modules/product/controllers/cart_controller.dart';
import 'package:getx_api_integration_practice/app/modules/product/models/product_model.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    products.addAll([
      ProductModel(quantity: 0.obs, name: 'product 1', price: 12.34),
      ProductModel(quantity: 0.obs, name: 'product 2', price: 15.76),
      ProductModel(quantity: 0.obs, name: 'product 3', price: 16.56),
      ProductModel(quantity: 0.obs, name: 'product 4', price: 11.59),
      ProductModel(quantity: 0.obs, name: 'product 5', price: 14.59),
      ProductModel(quantity: 0.obs, name: 'product 6', price: 11.59),
    ]);

    super.onInit();
  }

  Color getBackgroundColor(int index) {
    List<Color> colors = [
      Colors.red.shade100,
      Colors.blue.shade100,
      Colors.green.shade100,
      Colors.yellow.shade100,
      Colors.purple.shade100,
    ];
    return colors[index % colors.length];
  }
}
