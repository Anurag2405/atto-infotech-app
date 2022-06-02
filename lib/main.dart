import 'package:attoform/screens/formpage.dart';
import 'package:attoform/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Homepage(),
      "/form": (context) => Infoform(),
    },
  ));
}

