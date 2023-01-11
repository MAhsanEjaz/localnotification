import 'package:flutter/cupertino.dart';
import 'package:notification_prac/model/new_product_model.dart';

class NewProductProvider extends ChangeNotifier {
  List<MyProducts>? myProduct = [];

  getProduct({List<MyProducts>? myNewProduct}) {
    myProduct = myNewProduct;
    notifyListeners();
  }
}
