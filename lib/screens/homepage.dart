import 'package:attoform/models/client.dart';
import 'package:attoform/screens/client_card.dart';
import 'package:attoform/screens/formpage.dart';
import 'package:flutter/material.dart';
import 'package:attoform/widget/search_widget.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  String query = '';
  late List<Client> clients;

  @override
  void initState() {
    super.initState();

    clients = ClientList;
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
    final clients = ClientList.where((client) {
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'People',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
