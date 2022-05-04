import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tranhatuankiet_18dh110808/homepage/homepage.dart';

import '../../../model/utilities.dart';

class AccountDetail extends StatefulWidget {
  @override
  _AccountDetailState createState() => _AccountDetailState();
}

class _AccountDetailState extends State<AccountDetail> {
  final _formKey = GlobalKey<FormState>();
  bool _value = true;

  var prefs;
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final sdt = TextEditingController();
  final diaChi = TextEditingController();

  late FToast fToast;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fToast = FToast();
    fToast.init(context);
    _getData();
  }

  _getData() async {
    prefs = await SharedPreferences.getInstance();
    if (!prefs.getString('username').isEmpty) {
      email.text = prefs.getString('username');
      password.text = prefs.getString('password');
      fullName.text = prefs.getString('fullName');
      sdt.text = prefs.getString('sdt');
      diaChi.text = prefs.getString('diaChi');
      print(email);
      print(password);
      _value = prefs.getBool('check');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            fullNameTextFormField(),
            const SizedBox(
              height: 15,
            ),
            emailTextFormField(),
            const SizedBox(
              height: 15,
            ),
            passwordTextFormField(),
            const SizedBox(
              height: 15,
            ),
            addressTextFormField(),
            const SizedBox(
              height: 15,
            ),
            phoneNumberTextFormField(),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('fullName', fullName.text);
                  prefs.setString('sdt', sdt.text);
                  prefs.setString('diaChi', diaChi.text);
                  Utilities.showSnackBar(context, "Change information success");
                  Navigator.pushReplacementNamed(context, HomePage.routeName);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/facebook-2.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/google-icon.svg"),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xFFF5F6F9), shape: BoxShape.circle),
                    child: SvgPicture.asset("assets/icons/twitter.svg"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      controller: email,
      enabled: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your email ",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.email_outlined)),
    );
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      controller: password,
      enabled: false,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your password",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.lock_outline)),
    );
  }

  TextFormField fullNameTextFormField() {
    return TextFormField(
      controller: fullName,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your Full Name",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.perm_contact_cal)),
    );
  }

  TextFormField addressTextFormField() {
    return TextFormField(
      controller: diaChi,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your Address",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.location_on_outlined)),
    );
  }

  TextFormField phoneNumberTextFormField() {
    return TextFormField(
      controller: sdt,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Enter your Phone",
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.phone)),
    );
  }
}
