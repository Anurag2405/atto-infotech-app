import 'package:attoform/models/product.dart';
import 'package:attoform/screens/formpage.dart';
import 'package:attoform/screens/homepage.dart';
import 'package:attoform/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:attoform/screens/notifications.dart';

void main() {
  runApp(MaterialApp(
    home: NotificationsPage(),
    // home: Homepage(),
    // home: ProductsMaster(),
    // home: Infoform(),
    // initialRoute: "/",
    // routes: {
    //   "/": (context) => Homepage(),
    //   "/form": (context) => Infoform(),
    //},
  ));
}
