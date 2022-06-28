import 'package:attoform/models/product.dart';
import 'package:attoform/services/database.dart';
import 'package:flutter/material.dart';
class EditProductForm extends StatefulWidget {
  Product product;
  EditProductForm({required this.product});

  @override
  State<EditProductForm> createState() => _EditProductFormState();
}

class _EditProductFormState extends State<EditProductForm> {
  final formKey = GlobalKey<FormState>();
  String? name;
  String? price;

  Widget buildname() => TextFormField(
    initialValue: widget.product.name,
      decoration: InputDecoration(
        labelText: "Name",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.length < 3) {
          return "Enter atleast 3 characters";
        } else {
          return null;
        }
      },
      onChanged: (value) => setState(() {
        name = value;
      }));

  Widget buildPhone() => TextFormField(
    initialValue: widget.product.price,
      decoration: InputDecoration(
        labelText: "Price",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.length < 1) {
          return "Enter a valid price";
        } else {
          return null;
        }
      },
      onChanged: (value) => setState(() {
        price = value;
      }));

  Widget buildSubmit() => SizedBox(
    height: 50,
    child: ElevatedButton(
      // style:  ElevatedButton.styleFrom(primary: Colors.green),
      child: Text(
        "Submit",
        style: TextStyle(fontSize: 24),
      ),
      onPressed: () {
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          name ??= widget.product.name;
          price ??= widget.product.price;
          DatabaseService().updateProductMaster(widget.product.uid,name.toString(), price.toString()).then((value) => {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Product Edited!'),
                // action: SnackBarAction(
                //   label: 'Action',
                //   onPressed: () {
                //     // Code to execute.
                //   },
                // ),
              ),
            ),
            Navigator.pop(context),
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (context) => Mainpage())),
          });
        }
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product form"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        actions: [
          IconButton(onPressed: (){DatabaseService().deleteProduct(widget.product.uid);}, icon: Icon(Icons.delete,color: Colors.black54,)),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            buildname(),
            const SizedBox(height: 16),
            buildPhone(),
            const SizedBox(height: 16),
            buildSubmit(),
          ],
        ),
      ),
    );
  }
}
