import 'package:get/get.dart';
import 'package:getx_api_integration_practice/app/modules/product/controllers/product_controller.dart';
import 'package:getx_api_integration_practice/app/modules/product/models/product_model.dart';

class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;
  var totalAmount = 0.0.obs;

  int existInTheCart(ProductModel product) {
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].name == product.name) {
        return i;
      }
    }
    return -1;
  }

  void addToCart(ProductModel product) {
    int indexOfTheItem = existInTheCart(product);

    if (indexOfTheItem != -1) {
      cartItems[indexOfTheItem].quantity + 1;
    } else {
      cartItems.add(product);
    }
  }

  void removeFromCart(ProductModel product) {
    int indexIfExists = existInTheCart(product);

    if (indexIfExists != -1) {
      cartItems[indexIfExists].quantity - 1;
      if (cartItems[indexIfExists].quantity.value == 0) {
        cartItems.remove(cartItems[indexIfExists]);
      }
    }
  }

  void calculateTotal() {}
}
