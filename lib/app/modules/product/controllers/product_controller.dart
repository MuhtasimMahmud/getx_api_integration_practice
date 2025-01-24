import 'package:get/get.dart';
import 'package:getx_api_integration_practice/app/modules/product/models/product_model.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;

  @override
  void onInit() {
    products.addAll([
      ProductModel(name: 'product 1', price: 12.34),
      ProductModel(name: 'product 2', price: 15.76),
      ProductModel(name: 'product 3', price: 16.56),
      ProductModel(name: 'product 4', price: 11.59),
    ]);
    super.onInit();
  }
}
