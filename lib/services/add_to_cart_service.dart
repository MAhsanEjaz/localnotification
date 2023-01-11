import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notification_prac/model/cart_model.dart';
import 'package:notification_prac/model/new_product_model.dart';
import 'package:notification_prac/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class AddToCartService {
  static Future addToCartService(
      {required BuildContext context, MyProducts? products}) async {
    try {
      CartModel cartModel = CartModel(newProducts: products);

      Provider.of<CartProvider>(context, listen: false)
          .addToCartManually(ourCartModel: cartModel);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Add to cart successfully'),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green[700],
      ));

      return true;
    } catch (err) {
      print(err);
    }
  }
}
