import 'package:get/get.dart';

class ProductModel {
  final String name;
  RxInt price;
  RxInt quantity;

  ProductModel(
      {required this.quantity, required this.name, required this.price});
}
