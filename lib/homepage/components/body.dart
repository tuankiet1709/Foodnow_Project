import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tranhatuankiet_18dh110808/homepage/components/fragment/account_detail.dart';
import 'package:tranhatuankiet_18dh110808/homepage/components/fragment/favorite_fragment.dart';
import 'package:tranhatuankiet_18dh110808/homepage/components/fragment/home_fragment.dart';

import 'package:tranhatuankiet_18dh110808/homepage/components/homeheader.dart';
import 'package:tranhatuankiet_18dh110808/homepage/components/fragment/notification_fragment.dart';
import 'package:tranhatuankiet_18dh110808/model/utilities.dart';

import 'menuheader.dart';

class Body extends StatefulWidget {
  int? index;
  Body(this.index);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var selectIndex = 0;
  var flag = true;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeDetail(),
      FavoriteDetail(Utilities.data),
      NotificationDetail(Utilities.carts),
      AccountDetail()
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: flag ? HomeHeader() : MenuHeader(),
        backgroundColor: flag ? Colors.transparent : Colors.green,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.index ?? selectIndex,
        onTap: (index) {
          setState(() {
            selectIndex = index;
            widget.index = index;
            if (selectIndex != 3) {
              flag = true;
            } else {
              flag = false;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            screen[widget.index ?? selectIndex]
          ],
        ),
      ),
    );
  }
}
