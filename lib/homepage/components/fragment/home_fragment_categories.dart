import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tranhatuankiet_18dh110808/model/categories.dart';

import '../../../category/categorypage.dart';

class CategoriesStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Categories.init();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  'Categories',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                )),
                Text(
                  'See more',
                  style: TextStyle(fontSize: 16, color: Colors.lightGreen),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              // child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: categories.length,
              //     itemBuilder: (context, index) {
              //       return CategoriesItem(category: categories[index]);
              //     }),
              child: buildListView(categories),
            )
          ],
        ),
      ),
    );
  }

  FutureBuilder buildFutureBuilder(Future<List<Categories>> data) {
    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          return buildListView(snapshot.data as List<Categories>);
        });
  }

  ListView buildListView(List<Categories> categories) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, CategoryPage.routeName,
                  arguments: categories[index].id);
            },
            child: CategoriesItem(category: categories[index]),
          );
        });
  }
}

class CategoriesItem extends StatelessWidget {
  Categories category;

  CategoriesItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(5),
      child: Image.asset(category.image),
    );
  }
}
