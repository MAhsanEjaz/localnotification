import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notification_prac/providers/new_product_provider.dart';
import 'package:notification_prac/screens/cart_screen.dart';
import 'package:notification_prac/screens/detail_screen.dart';
import 'package:notification_prac/services/my_product_service.dart';
import 'package:notification_prac/widgets/my_card.dart';
import 'package:provider/provider.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({Key? key}) : super(key: key);

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  getProducts() {
    ProductService().myProductService(context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => CartScreen()));
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(color: Colors.black12)),
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(CupertinoIcons.cart),
                  )),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.cyan.shade600,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 15),
                    child: Text(
                      'Welcome Sir What you want\n in our Store!!!!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: .8),
                    ),
                  )),
            ),
            Consumer<NewProductProvider>(
              builder: (context, data, _) {
                List<Widget> widget = [];
                data.myProduct!.forEach((element) {
                  widget.add(InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) =>
                                    DetailScreen(products: element)));
                      },
                      child: MyCard(myProducts: element)));
                });
                return Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    children: widget,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
