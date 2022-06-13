import 'package:attoform/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  Product product;
  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(height: 20),
                Text(product.productId),
                SizedBox(height: 10),
              ],
            ),
            Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green[100],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text("₹"),
                        Text(product.price)
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
