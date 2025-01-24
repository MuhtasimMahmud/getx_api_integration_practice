import 'package:get/get.dart';
import 'package:getx_api_integration_practice/app/modules/product/views/product_details_view.dart';
import 'package:getx_api_integration_practice/app/modules/product/views/product_view.dart';
import 'package:getx_api_integration_practice/app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.PRODUCT, page: () => ProductView()),
    GetPage(name: Routes.PRODUCT_DETAILS, page: () => ProductDetailsView())
  ];
}
