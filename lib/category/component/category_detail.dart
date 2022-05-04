import 'package:flutter/material.dart';

import '../../model/products.dart';
import '../../model/utilities.dart';

class CategoryDetail extends StatefulWidget {
  int id;

  CategoryDetail(this.id);

  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  @override
  Widget build(BuildContext context) {
    return buildListView(Utilities().getProductFormCate(widget.id));
  }

  FutureBuilder buildFutureBuilder(Future<List<Products>> data) {
    return FutureBuilder(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return buildListView(snapshot.data as List<Products>);
          }
          return Container();
        });
  }

  ListView buildListView(List<Products> data) {
    print(data.toString());
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: data[index].idProduct != null
                ? Image.network('${Utilities.host}${data[index].image}')
                : Image.asset(data[index].image),
            title: Text(data[index].title),
            trailing: Text(data[index].price.toString()),
            // onTap: (){
            //   Navigator.pushNamed(context, ProductPage.routeName)
            // },
          );
        });
  }
}
