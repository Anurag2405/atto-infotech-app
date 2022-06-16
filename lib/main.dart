import 'package:attoform/models/client.dart';
import 'package:attoform/screens/homepage.dart';
import 'package:attoform/services/database.dart';
import 'package:flutter/material.dart';
import 'package:attoform/screens/mainpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(StreamProvider<List<Client>>.value(
    catchError: (_, __) => [],
    initialData: demoClientList,
    value: DatabaseService().clientMasterStream,
    child: MaterialApp(
      home: Mainpage(),
    ),
  ));
}
