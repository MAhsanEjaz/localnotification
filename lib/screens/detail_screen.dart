import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:notification_prac/model/new_product_model.dart';
import 'package:notification_prac/providers/new_product_provider.dart';
import 'package:notification_prac/services/add_to_cart_service.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailScreen extends StatefulWidget {
  MyProducts? products;

  DetailScreen({this.products});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int active = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<NewProductProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CarouselSlider(
                          items: widget.products!.images!
                              .map((e) => Container(
                                    decoration: BoxDecoration(
                                        // border: Border.all(color: Colors.black),
                                        image: DecorationImage(
                                            image: NetworkImage(e),
                                            fit: BoxFit.cover)),
                                  ))
                              .toList(),
                          options: CarouselOptions(
                              onPageChanged: (index, r) {
                                active = index;
                                setState(() {});
                              },
                              autoPlay: true,
                              animateToClosest: true,
                              disableCenter: true,
                              enlargeCenterPage: true,
                              pageSnapping: true,
                              viewportFraction: 1),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 15,
                      child: AnimatedSmoothIndicator(
                          curve: Curves.slowMiddle,
                          effect: WormEffect(
                              activeDotColor: Colors.red,
                              dotHeight: 5,
                              dotWidth: 7,
                              paintStyle: PaintingStyle.stroke),
                          activeIndex: active,
                          count: widget.products!.images!.length),
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.products!.title.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Text(
                      widget.products!.description.toString(),
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.amber),
                      onPressed: () {
                        bottomSheetCustom(true);
                      },
                      child: Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.cyan),
                      onPressed: () {
                        bottomSheetCustom(false);
                      },
                      child: Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            )
          ],
        ),
      );
    });
  }

  bottomSheetCustom(bool openBottom) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.products!.thumbnail.toString()),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.products!.title.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text(
                                    widget.products!.price.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: openBottom ? Colors.amber : Colors.cyan,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0))),
                        onPressed: () {
                          Navigator.pop(context);
                          AddToCartService.addToCartService(
                              context: context, products: widget.products);
                        },
                        child: Text(
                          openBottom ? 'Buy now' : 'Add to cart',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  )
                ],
              ),
            ));
  }
}
