import 'package:attoform/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  Product product;
  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name),
            SizedBox(height: 10),
            Text(product.productId),
            SizedBox(height: 20),
            Text(product.price)
          ],
        ),
      ),
    );
  }
}
