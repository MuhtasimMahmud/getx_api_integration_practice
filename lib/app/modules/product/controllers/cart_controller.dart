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

  // void addToCart(ProductModel product) {
  //   cartItems.add(product);
  //   totalAmount = (totalAmount.value + product.price.value) as RxDouble;
  // }

  void removeFromCart(ProductModel product) {
    int indexOfTheItem = existInTheCart(product);
    if (indexOfTheItem != -1) {
      cartItems[indexOfTheItem].quantity.value--;
      if (cartItems[indexOfTheItem].quantity.value == 0) {
        cartItems.remove(product);
      }
      totalAmount = (totalAmount.value - product.price.value) as RxDouble;
    }
  }

  void calculateTotal(List<ProductModel> products) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].quantity > 0) {
        cartItems.add(products[i]);
        totalAmount.value = totalAmount.value +
            (products[i].price * products[i].quantity.value);
      }
    }
  }
}
