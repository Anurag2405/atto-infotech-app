import 'package:attoform/models/product.dart';
import 'package:attoform/screens/productform.dart';
import 'package:attoform/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductsMaster extends StatefulWidget {
  const ProductsMaster({Key? key}) : super(key: key);

  @override
  State<ProductsMaster> createState() => _ProductsMasterState();
}

class _ProductsMasterState extends State<ProductsMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products',),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, int index) {
              return ProductCard(product: productList[index]);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn2",
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Prodform()));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.indigo,
        ),
      ),
    );
  }
}
