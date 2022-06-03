import 'package:attoform/models/client.dart';
import 'package:attoform/screens/client_card.dart';
import 'package:attoform/screens/formpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
      body: ListView.builder(
          itemCount: ClientList.length,
          itemBuilder: (context, int index) {
            return ClientCard(client: ClientList[index]);
          }),
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
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
