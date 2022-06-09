import 'package:attoform/models/client.dart';
import 'package:attoform/screens/products.dart';
import 'package:attoform/widget/client_card.dart';
import 'package:attoform/screens/formpage.dart';
import 'package:flutter/material.dart';
import 'package:attoform/widget/search_widget.dart';
import 'package:attoform/screens/notifications.dart';

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

    clients = clientList;
  }


  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'client name or service type',
        onChanged: searchBook,
      );

  void searchBook(String query) {
    final clients = clientList.where((client) {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Atto Infotech',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black87,
              fontFamily: "Roboto"),
        ),
      ),
      body: Column(
        children: [
          buildSearch(),
          Expanded(
            child: ListView.builder(
                itemCount: clients.length,
                itemBuilder: (context, int index) {
                  return ClientCard(client: clients[index]);
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.indigo,
        ),
      ),
    );
  }
}
