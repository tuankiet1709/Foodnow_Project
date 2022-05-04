import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tranhatuankiet_18dh110808/model/products.dart';
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';
import 'package:quiver/strings.dart';

class Utilities {
  static String host = 'https://172.16.33.213:3000/';
  Uri url = Uri.parse('http://192.168.0.100:3000/api/food');

  static List<Products> data = [];

  Future<List<Products>> getProducts() async {
    var res = await http.get(url);
    if (res.statusCode == 200) {
      var content = res.body;
      print(content.toString());
      var arr = json.decode(content)['food'] as List;

      // for every element of arr map to _fromJson
      // and convert the array to list

      return arr.map((e) => _fromJson(e)).toList();
    }

    return <Products>[];
  }

  Products _fromJson(Map<String, dynamic> item) {
    return Products(
      id: item['id'],
      description: item['description'],
      title: item['title'],
      image: item['image'],
      price: double.parse(item['price']),
      cateID: int.parse(item['cateID']),
    );
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 8) {
      return 'Password should be more than 8 characters ';
    } else {
      return null;
    }
  }

  static String? conformPassword(String value, String value2) {
    if (!equalsIgnoreCase(value, value2)) {
      return "Conform password invalid";
    } else {
      return null;
    }
  }

  static String? validateEmailLogin(String inp_email, String prefs_email) {
    if (inp_email.isEmpty) {
      return 'Please enter mail';
    }
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (!regex.hasMatch(inp_email)) {
      return 'Enter Valid Email';
    }
    if (inp_email != prefs_email) {
      return 'Email is not registered';
    } else {
      return null;
    }
  }

  static String? validatePasswordLogin(String inp_pass, String prefs_pass) {
    if (inp_pass.isEmpty) {
      return 'Please enter password';
    }
    if (inp_pass.length < 8) {
      return 'Password should be more than 8 characters ';
    }
    if (inp_pass != prefs_pass) {
      return 'Password is not correct';
    } else {
      return null;
    }
  }

  List<Products> getProductFormCate(int id) {
    var data = Products.init();
    return data.where((p) => p.cateID == id).toList();
  }

  static showSnackBar(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.green,
      ),
    );
  }
}
