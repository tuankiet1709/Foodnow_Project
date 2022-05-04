import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tranhatuankiet_18dh110808/cart/cartpage.dart';

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(5.0),
                filled: true,
                fillColor: Colors.white,
                hintText: "Search product",
                prefixIcon: Icon(Icons.search)),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, CartPage.routeName);
          },
          child: Container(
              margin: const EdgeInsets.only(left: 10),
              height: 40,
              width: 40,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9), shape: BoxShape.circle),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              )),
        )
      ],
    );
  }
}
