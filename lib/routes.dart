import 'package:flutter/widgets.dart';
import 'package:tranhatuankiet_18dh110808/category/categorypage.dart';
import 'package:tranhatuankiet_18dh110808/detail/productpage.dart';
import 'package:tranhatuankiet_18dh110808/homepage/homepage.dart';
import 'package:tranhatuankiet_18dh110808/signup/signupsreen.dart';
import 'package:tranhatuankiet_18dh110808/signup/signup_page.dart';

import 'package:tranhatuankiet_18dh110808/splashpage.dart';
import 'package:tranhatuankiet_18dh110808/signin/signinpage.dart';

import 'cart/cartpage.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  SignInPage.routeName: (context) => SignInPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  HomePage.routeName: (context) => HomePage(),
  CategoryPage.routeName: (context) => CategoryPage(),
  ProductPage.routeName: (context) => ProductPage(),
  CartPage.routeName: (context) => CartPage(),
};
