import 'package:flutter/cupertino.dart';
import 'package:notification_prac/model/cart_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel>? cartModel = [];

  double totalCalculatedPrice = 0;

  getProducts({List<CartModel>? newCartModel}) {
    cartModel = newCartModel;
    _totalCalculatedPrice();
    notifyListeners();
  }

  addToCartManually({CartModel? ourCartModel}) {
    for (int i = 0; i < cartModel!.length; i++) {
      if (cartModel![i].newProducts!.id == ourCartModel!.newProducts!.id) {
        cartModel![i].newProducts!.qty++;

        cartModel![i].newProducts!.totalPrice =
            double.parse(cartModel![i].newProducts!.price.toString()) *
                cartModel![i].newProducts!.qty;
        _totalCalculatedPrice();

        notifyListeners();
        return;
      } else {
        notifyListeners();
      }
    }

    cartModel!.add(ourCartModel!);
    _totalCalculatedPrice();
    notifyListeners();
  }

  deleteItem(int index) {
    cartModel!.removeAt(index);
    _totalCalculatedPrice();
    notifyListeners();
  }

  _totalCalculatedPrice() {
    double tempTotal = 0;
    cartModel!.forEach((element) {
      tempTotal = tempTotal + element.newProducts!.totalPrice!;
      print(tempTotal);
    });
    totalCalculatedPrice = tempTotal;
  }

  emptyCart() {
    cartModel = [];
    notifyListeners();
  }

  updateCartItems(int index, int qty) {
    cartModel![index].newProducts!.qty = qty;
    cartModel![index].newProducts!.totalPrice = qty *
        double.parse(
          cartModel![index].newProducts!.price.toString(),
        );
    print('nmber');
    _totalCalculatedPrice();
    notifyListeners();
  }
}
