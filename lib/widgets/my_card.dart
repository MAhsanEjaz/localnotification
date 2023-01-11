import 'package:flutter/material.dart';
import 'package:notification_prac/model/new_product_model.dart';

class MyCard extends StatefulWidget {
  MyProducts? myProducts;

  MyCard({this.myProducts});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 2.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              widget.myProducts!.thumbnail.toString()),
                          fit: BoxFit.fill)),
                ),
                SizedBox(height: 6.0),
                Container(
                  width: 100,
                  child: Text(
                    widget.myProducts!.title.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: .2,
              right: .2,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Add to cart'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
