import 'package:flutter/material.dart';

import '../../../model/carts.dart';

class NotificationDetail extends StatelessWidget {
  List<Cart> carts;

  NotificationDetail(this.carts);

  @override
  Widget build(BuildContext context) {
    if (carts.length > 0) {
      return Expanded(
        child: Container(
          child: ListView.builder(
              itemCount: carts.length,
              itemBuilder: (context, index) {
                return CartItemList(
                  cart: carts[index],
                );
              }),
        ),
      );
    } else {
      return Expanded(
          child: Container(
        alignment: Alignment.center,
        height: 100,
        child: Text('There is no Notification',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green)),
      ));
    }
  }
}

class CartItemList extends StatelessWidget {
  Cart cart;

  CartItemList({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 80,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "DateTime: " + cart.dateTime.toString(),
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                        child: Text(
                      "Status: " + cart.status.toString(),
                      style: TextStyle(fontSize: 14),
                    ))
                  ],
                )),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      "",
                      style: TextStyle(fontSize: 10),
                    )),
                    Expanded(
                        child: Text(
                      cart.price.toString(),
                      style: TextStyle(fontSize: 25),
                    )),
                    Expanded(
                        child: Text(
                      "",
                      style: TextStyle(fontSize: 10),
                    ))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
