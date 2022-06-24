import 'package:attoform/models/product.dart';
import 'package:attoform/screens/forms/edit_product_form.dart';
import 'package:attoform/screens/forms/add_product_form.dart';
import 'package:attoform/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsMaster extends StatefulWidget {
  const ProductsMaster({Key? key}) : super(key: key);

  @override
  State<ProductsMaster> createState() => _ProductsMasterState();
}

class _ProductsMasterState extends State<ProductsMaster> {
  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<List<Product>>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, int index) {
              return InkWell(
                  child: ProductCard(product: productList[index]),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => EditProduct(product: productList[index]),
                    )) ,
              );
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
