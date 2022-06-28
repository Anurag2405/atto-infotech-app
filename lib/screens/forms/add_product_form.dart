import 'package:attoform/services/database.dart';
import 'package:flutter/material.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({Key? key}) : super(key: key);

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String price = '';

  Widget buildname() => TextFormField(
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
              DatabaseService().createProductMaster(name, price).then((value) => {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Product Added!'),
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
