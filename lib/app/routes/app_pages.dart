import 'package:get/get.dart';
import 'package:getx_api_integration_practice/app/modules/product/views/cart_view.dart';
import 'package:getx_api_integration_practice/app/modules/product/views/product_details_view.dart';
import 'package:getx_api_integration_practice/app/modules/product/views/product_view.dart';
import 'package:getx_api_integration_practice/app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.products, page: () => ProductView()),
    GetPage(name: Routes.productDetails, page: () => ProductDetailsView()),
    GetPage(name: Routes.cartView, page: () => CartView())
  ];
}
