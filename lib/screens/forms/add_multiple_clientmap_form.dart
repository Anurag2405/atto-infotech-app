import 'package:attoform/models/clientprodmap.dart';
import 'package:attoform/screens/forms/map_form_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:provider/provider.dart';
import 'package:attoform/models/client.dart';
import 'package:attoform/services/database.dart';

class AddMaps extends StatefulWidget {
  const AddMaps({Key? key}) : super(key: key);

  @override
  State<AddMaps> createState() => _AddMapsState();
}

class _AddMapsState extends State<AddMaps> {
  String? _result;
  String? name;
  List<FormItemWidget> clientProductForms = List.empty(growable: true);

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

  @override
  Widget build(BuildContext context) {
    final clientListt = Provider.of<List<Client>>(context);
    List<String> clientnames = [];
    clientListt.forEach((element) {
      clientnames.add(element.name);
    });

    onRemove(ClientProduct clientprod) {
      setState(() {
        int index = clientProductForms
            .indexWhere((element) => element.clientProduct.uid == clientprod.uid);

        if (clientProductForms != null) clientProductForms.removeAt(index);
      });
    }

    onAdd() {
      setState(() {
        ClientProduct _clientProductModel = ClientProduct(
            uid: clientProductForms.length.toString(),
            name: "",
            product: "",
            price: "",
            dateOfExpiry: DateTime.now().toString(),
            note: "");
        clientProductForms.add(FormItemWidget(
            clientProduct: _clientProductModel,
            onRemove: () => onRemove(_clientProductModel),
            index: clientProductForms.length + 1));
      });
    }

    onSave() {
      for (int i = 0; i < clientProductForms.length; i++) {
        FormItemWidget item = clientProductForms[i];
        // debugPrint("Name: ${item.clientProduct.product}");
        // debugPrint("Name: ${item.clientProduct.price}");
        // debugPrint("Name: ${item.clientProduct.dateOfExpiry}");
        // debugPrint("Name: ${item.clientProduct.note}");
        DatabaseService().createClientProductMaster(
            name.toString(),
            item.clientProduct.product.toString(),
            item.clientProduct.price.toString(),
            item.clientProduct.dateOfExpiry.toString(),
            item.clientProduct.note);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Maps Added!'),
        ),
      );
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic form"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            onSave();
          },
          child: Text(
            "Save",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn5",
        onPressed: () {
          onAdd();
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.indigo,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            clientDrop(clientnames),
            SizedBox(
              height: 16,
            ),
            Flexible(
              child: Builder(builder: (context) {
                return ListView.builder(
                    // shrinkWrap: true,
                    // itemCount: _count,
                    // itemBuilder: (context, index) {
                    //   return FormItemWidget(clientProduct: ClientProduct);
                    itemCount: clientProductForms.length,
                    itemBuilder: (_, index) {
                      return clientProductForms[index];
                    });
              }),
            ),
            SizedBox(
              height: 20,
            ),
            Text(_result ??= ""),
          ],
        ),
      ),
    );
  }
}
