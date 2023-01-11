import 'package:flutter/material.dart';
import 'package:notification_prac/providers/cart_provider.dart';
import 'package:notification_prac/widgets/cart_card_view.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Column(
          children: [
            Expanded(
              child: SafeArea(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.cartModel!.length,
                    itemBuilder: (context, index) {
                      return CartCardView(
                        index: index,
                        onTap: () {
                          data.deleteItem(index);
                          setState(() {});
                        },
                        newProducts: data.cartModel![index].newProducts,
                      );
                    }),
              ),
            ),
            Text(data.totalCalculatedPrice.toString()),
            SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Checkout'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0))),
                ))
          ],
        ),
      );
    });
  }
}
