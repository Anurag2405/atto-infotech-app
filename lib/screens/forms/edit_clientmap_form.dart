import 'package:attoform/models/clientprodmap.dart';
import 'package:attoform/services/database.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class EditMap extends StatefulWidget {
  ClientProduct map;
  EditMap({required this.map});

  @override
  State<EditMap> createState() => _EditMapState();
}

class _EditMapState extends State<EditMap> {
  final formKey = GlobalKey<FormState>();
  String? name;
  String? product;
  DateTime? expDate;
  String? price;

  Widget clientDrop(List<String> item) => DropdownSearch<String>(
        popupProps: PopupProps.menu(
          menuProps: MenuProps(),
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
        selectedItem: widget.map.name,
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
        selectedItem: widget.map.product,
      );

  Widget buildexp() => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListTile(
          title: Text(
            expDate == null ? widget.map.dateOfExpiry : expDate.toString(),
            style: TextStyle(color: Colors.grey[600]),
          ),
          trailing: Icon(Icons.calendar_month_outlined),
          onTap: () {
            showDatePicker(
              context: context,
              firstDate: DateTime(2015),
              lastDate: DateTime(2099),
              initialDate: expDate == null ? DateTime.now() : expDate!,
            ).then((date) {
              setState(() {
                expDate = date;
              });
            });
          },
        ),
      );

  Widget buildPrice() => TextFormField(
      initialValue: widget.map.price,
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
              name ??= widget.map.name;
              price ??= widget.map.price;
              expDate ??= DateTime.parse(widget.map.dateOfExpiry);
              product ??= widget.map.product;

              print(name);
              print(product);
              print(expDate);
              print(price);

              // DatabaseService().createClientMaster(
              //     name.toString(), "emailId", "phoneNumber", product.toString(), expDate.toString()).then((value) => {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     SnackBar(
              //       content: const Text('Map Added!'),
              //     ),
              //   ),
              //   Navigator.pop(context),
              //
              // });
            }
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    final clients = ['Anurag', 'Ashish', 'Mayank', 'Example', 'Example2'];
    final items = ['Domain', 'Hosting', 'SSl', 'Email', 'Web'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Client form"),
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
            clientDrop(clients),
            const SizedBox(height: 16),
            productDrop(items),
            const SizedBox(height: 16),
            buildPrice(),
            const SizedBox(height: 16),
            buildexp(),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            buildSubmit(),
          ],
        ),
      ),
    );
  }
}
