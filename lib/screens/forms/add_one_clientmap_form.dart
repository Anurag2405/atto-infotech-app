import 'package:attoform/models/product.dart';
import 'package:attoform/services/database.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';
import 'package:attoform/models/client.dart';

class AddMap extends StatefulWidget {
  const AddMap({Key? key}) : super(key: key);

  @override
  State<AddMap> createState() => _AddMapState();
}

class _AddMapState extends State<AddMap> {
  final formKey = GlobalKey<FormState>();
  String? name;
  String? product;
  DateTime? dateOfExpiry;
  String? price;
  String note = "";

  Widget clientDrop(List<String> item) => DropdownSearch<String>(
        popupProps: PopupProps.menu(
          showSelectedItems: true,
          showSearchBox: true,
        ),
        items: item,
        validator: (String? item) {
          if (item == null)
            return "Required field";
          else if (item == "Select a client")
            return "Please select a client";
          else
            return null;
        },
        onChanged: (val) {
          name = val;
        },
        selectedItem: "Select a client",
      );

  Widget productDrop(List<String> item) => DropdownSearch<String>(
        popupProps: PopupProps.menu(
          showSelectedItems: true,
          showSearchBox: true,
        ),
        items: item,
        validator: (String? item) {
          if (item == null)
            return "Required field";
          else if (item == "Select a product")
            return "Please select a product";
          else
            return null;
        },
        onChanged: (val) {
          product = val;
        },
        selectedItem: "Select a product",
      );

  Widget buildexp() => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListTile(
          title: Text(
            dateOfExpiry == null ? "Pick the expiry date" : dateOfExpiry.toString(),
            style: TextStyle(color: Colors.grey[600]),
          ),
          trailing: Icon(Icons.calendar_month_outlined),
          onTap: () {
            showDatePicker(
              context: context,
              firstDate: DateTime(2015),
              lastDate: DateTime(2099),
              initialDate: dateOfExpiry == null ? DateTime.now() : dateOfExpiry!,
            ).then((date) {
              setState(() {
                dateOfExpiry = date;
              });
            });
          },
        ),
      );

  Widget buildPrice() => TextFormField(
      decoration: InputDecoration(
        labelText: "Price",
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.length < 1) {
          return "Enter a valid number";
        } else {
          return null;
        }
      },
      onChanged: (value) => setState(() {
            price = value;
          }));

  Widget buildnote() => TextFormField(
      decoration: InputDecoration(
        labelText: "Note (optional)",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.note_add_rounded),
      ),
      onChanged: (value) => setState(() {
            note = value;
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
              DatabaseService()
                  .createClientProductMaster(
                      name.toString(),
                      product.toString(),
                      price.toString(),
                      dateOfExpiry.toString(),
                      note)
                  .then((value) => {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Map Added!'),
                          ),
                        ),
                        Navigator.pop(context),
                      });
            }
          },
        ),
      );

  @override
  Widget build(BuildContext context) {

    //to get client name list for dropdown in the form
    final clientListt = Provider.of<List<Client>>(context);
    List<String> clientnames = [];
    clientListt.forEach((element) {
      clientnames.add(element.name);
    });

    //to get product names list for dropdown ini the form

    final productList = Provider.of<List<Product>>(context);
    List<String> items = [];
    productList.forEach((element) {
      items.add(element.name);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Client Product Mapping"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            const SizedBox(height: 16),
            clientDrop(clientnames),
            const SizedBox(height: 16),
            productDrop(items),
            const SizedBox(height: 16),
            buildPrice(),
            const SizedBox(height: 16),
            buildexp(),
            const SizedBox(height: 16),
            buildnote(),
            const SizedBox(height: 16),
            buildSubmit(),
          ],
        ),
      ),
    );
  }
}
