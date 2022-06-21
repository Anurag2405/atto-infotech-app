import 'package:attoform/screens/clientL.dart';
import 'package:flutter/material.dart';
import 'package:attoform/screens/ClientM.dart';
import 'package:attoform/screens/products.dart';
import 'package:attoform/screens/notifications.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int currentIndex = 0;
  final screens = [
    Homepage(),
    ClientListing(),
    ProductsMaster(),
    NotificationsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
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
        onTap: (index) => setState(() => currentIndex = index),
        // onTap: _onItemTapped,
      ),
    );
  }
}
