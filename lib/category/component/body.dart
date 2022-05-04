import 'package:flutter/material.dart';

import 'category_detail.dart';

class Body extends StatelessWidget {
  int cateID;
  Body(this.cateID);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CategoryDetail(cateID),
    );
  }
}
