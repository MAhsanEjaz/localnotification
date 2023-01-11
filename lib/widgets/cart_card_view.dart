import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notification_prac/model/new_product_model.dart';
import 'package:notification_prac/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartCardView extends StatefulWidget {
  MyProducts? newProducts;
  Function()? onTap;
  int? index;

  CartCardView({this.newProducts, this.onTap, this.index});

  @override
  State<CartCardView> createState() => _CartCardViewState();
}

class _CartCardViewState extends State<CartCardView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, data, _) {
      return Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.newProducts!.thumbnail.toString()),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 85,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.newProducts!.title
                                  .toString()
                                  .toUpperCase(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '\$${double.parse(widget.newProducts!.price.toString()) * widget.newProducts!.qty.toInt()}',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'x${widget.newProducts!.qty.toString()}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                InkWell(
                                  onTap: widget.newProducts!.qty.bitLength < 2
                                      ? null
                                      : () {
                                          data.updateCartItems(widget.index!,
                                              widget.newProducts!.qty);
                                          widget.newProducts!.qty--;
                                          setState(() {});
                                        },
                                  child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(
                                        CupertinoIcons.minus,
                                        color: Colors.black87,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                InkWell(
                                  onTap: () {
                                    widget.newProducts!.qty++;
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .updateCartItems(widget.index!,
                                            widget.newProducts!.qty);
                                    setState(() {});
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Icon(
                                        CupertinoIcons.plus,
                                        color: Colors.black87,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
            ],
          ),
          Positioned(
            right: 4,
            top: 0,
            child: InkWell(
              onTap: (widget.onTap),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.black54,
                    size: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
