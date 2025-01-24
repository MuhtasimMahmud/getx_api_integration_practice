import 'package:get/get.dart';
import 'package:getx_api_integration_practice/app/modules/product/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;
  var totalAmount = 0.0.obs;

  void addToCart(ProductModel product) {
    cartItems.add(product);
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
  }

  void calculateTotal() {
    totalAmount.value = cartItems.fold(0, (sum, item) => sum + item.price);
  }
}
