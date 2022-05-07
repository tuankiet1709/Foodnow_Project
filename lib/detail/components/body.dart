import 'package:flutter/material.dart';

import '../../model/products.dart';
import 'addtocart.dart';

class Body extends StatefulWidget {
  Products product;
  int _quantity = 1;
  Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 180,
            child: Image.asset(widget.product.image),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text("Desciption: ${widget.product.description}"),
            flex: 5,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Text("Price: ${widget.product.price}"),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Quantity: ', textAlign: TextAlign.left),
                  flex: 2,
                ),
                Expanded(
                  child: RoundedIconButton(
                      icon: Icons.remove,
                      iconSize: 30,
                      onPressed: () => setState(() {
                            widget._quantity = widget._quantity == 1
                                ? widget._quantity
                                : widget._quantity -= 1;
                          })),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    width: 30,
                    child: Text(
                      '${widget._quantity}',
                      style: const TextStyle(
                        fontSize: 30 * 0.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: RoundedIconButton(
                      icon: Icons.add,
                      iconSize: 30,
                      onPressed: () => setState(() {
                            widget._quantity += 1;
                          })),
                ),
                Expanded(
                  child: Text(''),
                  flex: 3,
                )
              ],
            ),
            flex: 1,
          ),
          SizedBox(
            height: 100,
          ),
          AddProductToCart(
            products: widget.product,
            quantity: widget._quantity,
          )
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton(
      {required this.icon, required this.onPressed, required this.iconSize});

  final IconData icon;
  final VoidCallback onPressed;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: iconSize, height: iconSize),
      elevation: 6.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(iconSize * 0.2)),
      fillColor: Colors.green,
      child: Icon(
        icon,
        color: Colors.white,
        size: iconSize * 0.8,
      ),
    );
  }
}
