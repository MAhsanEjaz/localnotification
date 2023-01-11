import 'package:flutter/material.dart';

class WrapScreen extends StatefulWidget {
  const WrapScreen({Key? key}) : super(key: key);

  @override
  State<WrapScreen> createState() => _WrapScreenState();
}

class _WrapScreenState extends State<WrapScreen> {
  List<String>? image = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXhMsDqPBzd2bFLdhnXNC3-Kkegyq1_EikjA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEVP-_J_hMBFyXBWEoVTQP5jW01mXSUT6oWw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9rHlPrvu77hDmxuj3nazp1_AEHoGsa34JOg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf75LuzpMnzWbH8vsj5zymsCtuv3rfUNplwQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5-xASFGs4cUKixAXmZlKzrHkP5pyqLn615g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7ibejW-20EFo_9uj6Ajo582cKbG45byre7g&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3wQsqkb4XMVJhlqEF8xICFyNv3Qz41iowAJpLxYjgFUsmxDzx_W0c1NdioCSAkpxCNCk&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                children: [
                  for (var item in image!)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width / 2.2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(item),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
