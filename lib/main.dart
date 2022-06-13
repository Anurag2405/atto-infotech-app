import 'package:attoform/models/product.dart';
import 'package:attoform/screens/formpage.dart';
import 'package:attoform/screens/homepage.dart';
import 'package:attoform/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:attoform/screens/notifications.dart';
import 'package:attoform/screens/mainpage.dart';
import 'package:attoform/screens/productform.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    home: Mainpage(),
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
