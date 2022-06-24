import 'package:attoform/models/client.dart';
import 'package:attoform/models/clientprodmap.dart';
import 'package:attoform/screens/forms/add_clientmap_form.dart';
import 'package:attoform/screens/forms/edit_client_form.dart';
import 'package:attoform/screens/forms/edit_clientmap_form.dart';
import 'package:attoform/screens/products.dart';
import 'package:attoform/widget/client_product_card.dart';
import 'package:attoform/screens/forms/add_client_form.dart';
import 'package:flutter/material.dart';
import 'package:attoform/widget/search_widget.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String query = '';
  late List<ClientProduct> clientProduct;

  @override
  void initState() {
    super.initState();

    clientProduct = demoClientProductList;
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'client name or service type',
        onChanged: searchBook,
      );

  void searchBook(String query) {
    final clients = demoClientList.where((client) {
      final nameLower = client.name.toLowerCase();
      //final serviceLower = client.service.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower);
      //||serviceLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.clientProduct = clientProduct;
    });
  }

  @override
  Widget build(BuildContext context) {
    //actively listening to stream of return type Clients
    final clientprodListt = Provider.of<List<ClientProduct>>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Atto Infotech',
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          buildSearch(),
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: ListView.builder(
                // itemCount: clients.length,
                // itemBuilder: (context, int index) {
                //   return ClientCard(client: clients[index]);}
                itemCount: clientprodListt.length,
                itemBuilder: (context, int index) {
                  return InkWell(
                    child: ClientProductCard(
                        clientProduct: clientprodListt[index]),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              // Editclient(client: clientprodListt[index]),
                          EditMap(map: clientprodListt[index]),
                        )),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AddMap()));
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
