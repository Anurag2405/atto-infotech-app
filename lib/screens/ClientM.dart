import 'package:attoform/models/client.dart';
import 'package:attoform/screens/editclientinfo.dart';
import 'package:attoform/screens/products.dart';
import 'package:attoform/widget/client_card.dart';
import 'package:attoform/screens/formpage.dart';
import 'package:flutter/material.dart';
import 'package:attoform/widget/search_widget.dart';
import 'package:attoform/screens/notifications.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String query = '';
  late List<Client> clients;

  @override
  void initState() {
    super.initState();

    clients = demoClientList;
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'client name or service type',
        onChanged: searchBook,
      );

  void searchBook(String query) {
    final clients = demoClientList.where((client) {
      final nameLower = client.name.toLowerCase();
      final serviceLower = client.service.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) ||
          serviceLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.clients = clients;
    });
  }

  @override
  Widget build(BuildContext context) {
    //actively listening to stream of return type Clients
    final clientListt = Provider.of<List<Client>>(context);

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
                itemCount: clientListt.length,
                itemBuilder: (context, int index) {
                  return InkWell(
                      child: ClientCard(client: clientListt[index]),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => Editclient(client: clientListt[index]),
                        )) ,
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Infoform()));
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