import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tranhatuankiet_18dh110808/homepage/homepage.dart';
import 'package:tranhatuankiet_18dh110808/model/categories.dart';
import 'component/body.dart';

class CategoryPage extends StatelessWidget {
  static String routeName = "/categoryDetail";

  @override
  Widget build(BuildContext context) {
    final int arguments = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Category Details"),
        ),
        body: Body(arguments));
  }
}
