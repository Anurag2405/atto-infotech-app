import 'package:attoform/models/clientprodmap.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';
import 'package:attoform/models/product.dart';

class FormItemWidget extends StatefulWidget {
  FormItemWidget(
      {Key? key,
      required this.clientProduct,
      required this.onRemove,
      required this.index})
      : super(key: key);

  final index;
  ClientProduct clientProduct;
  final Function onRemove;
  var state = _FormItemWidgetState();

  @override
  State<FormItemWidget> createState() {
    return this.state = new _FormItemWidgetState();
  }

  bool isValidated() => state.validate();
}

class _FormItemWidgetState extends State<FormItemWidget> {
  final formKey = GlobalKey<FormState>();
  DateTime? dateOfExp ;

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<List<Product>>(context);
    List<String> items = [];
    productList.forEach((element) {
      items.add(element.name);
    });
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Product - ${widget.index}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue),
                      ),
                    ),
                    TextButton(
                        onPressed: () => widget.onRemove(),
                        child: Text(
                          "Remove",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    showSearchBox: true,
                  ),
                  items: items,
                  validator: (String? item) {
                    if (item == null)
                      return "Required field";
                    else if (item == "Select a product")
                      return "Please select a product";
                    else
                      return null;
                  },
                  onChanged: (val) {
                    widget.clientProduct.product = val!;
                  },
                  selectedItem: "Select a product",
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ListTile(
                    title: Text(
                      widget.clientProduct.dateOfExpiry == ""
                          ? "Pick the expiry date"
                          : widget.clientProduct.dateOfExpiry,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    trailing: Icon(Icons.calendar_month_outlined),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2099),
                        initialDate: dateOfExp == null ? DateTime.now() : dateOfExp!,
                      ).then((date) {
                        setState(() {
                          dateOfExp = date;
                          widget.clientProduct.dateOfExpiry = dateOfExp.toString();
                        });
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                          widget.clientProduct.price = value;
                        })),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: "Note (optional)",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.note_add_rounded),
                    ),
                    onChanged: (value) => setState(() {
                          widget.clientProduct.note = value;
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validate() {
    //Validate Form Fields
    bool validate = formKey.currentState!.validate();
    if (validate) formKey.currentState!.save();
    return validate;
  }
}
