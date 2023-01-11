import 'package:flutter/cupertino.dart';
import 'package:notification_prac/model/new_product_model.dart';
import 'package:notification_prac/providers/new_product_provider.dart';
import 'package:notification_prac/services/custom_get_request.dart';
import 'package:provider/provider.dart';

class ProductService {
  Future myProductService({required BuildContext context}) async {
    try {
      var res = await CustomGetRequest().customGetRequest(
          context: context, url: 'https://dummyjson.com/products');

      if (res != null) {
        NewProducts newProducts = NewProducts.fromJson(res);

        Provider.of<NewProductProvider>(context, listen: false)
            .getProduct(myNewProduct: newProducts.products);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }
}
