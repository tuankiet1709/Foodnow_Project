import 'package:flutter/material.dart';

import '../model/products.dart';
import 'components/body.dart';

class ProductPage extends StatelessWidget {
  static String routeName = "details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)?.settings.arguments as ProductDetailsArguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(arguments.product.title),
      ),
      body: Body(product: arguments.product),
    );
  }
}

class ProductDetailsArguments {
  final Products product;

  ProductDetailsArguments({required this.product});
}
