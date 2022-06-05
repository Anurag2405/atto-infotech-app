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
        title: const Text('Product Master'),
      ),
    );
  }
}
