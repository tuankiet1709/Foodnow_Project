import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../homepage/homepage.dart';
import '../../model/carts.dart';
import '../../model/utilities.dart';
import 'body.dart';

class CheckOutCart extends StatelessWidget {
  List<CartItem> cartdetails;
  double sum;
  CheckOutCart({required this.sum, required this.cartdetails});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            height: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.green)),
            color: Colors.white,
            textColor: Colors.green,
            onPressed: () {},
            child: Text(
              "Sum: ${sum}",
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            height: 50,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(color: Colors.green)),
            onPressed: () {
              Cart cart = new Cart(
                  dateTime: DateTime.now(), status: "Delivery", price: sum);
              Utilities.carts.add(cart);

              cartdetails.clear();
              Navigator.pushReplacementNamed(context, HomePage.routeName,
                  arguments: 2);
            },
            color: Colors.green,
            textColor: Colors.white,
            child:
                Text("Check out".toUpperCase(), style: TextStyle(fontSize: 14)),
          ),
        )
      ],
    );
  }
}
