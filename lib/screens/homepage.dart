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
  int _selectedIndex = 0;
  String query = '';
  late List<Client> clients;
  int currentIndex = 0;
  final screens = [
    Homepage(),
    ProductsMaster(),
    NotificationsPage(),
  ];

  @override
  void initState() {
    super.initState();

    clients = clientList;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Notifications',
          ),
        ],
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: Colors.redAccent,
        onTap: (index)  => setState(() => currentIndex = index),
        // onTap: _onItemTapped,
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
