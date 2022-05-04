import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tranhatuankiet_18dh110808/signin/components/signin_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: headerScreen(context),
            flex: 1,
          ),
          Expanded(
            child: SignInForm(),
            flex: 4,
          ),
          Expanded(
            child: footerScreen(context),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget headerScreen(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      alignment: Alignment.bottomRight,
      child: Image.asset("assets/dish.png"),
    );
  }

  Widget footerScreen(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomLeft,
      child: Image.asset("assets/dish_2.png"),
    );
  }
}
