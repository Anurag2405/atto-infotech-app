import 'package:attoform/models/client.dart';
import 'package:attoform/models/clientprodmap.dart';
import 'package:attoform/models/product.dart';
import 'package:attoform/services/database.dart';
import 'package:flutter/material.dart';
import 'package:attoform/screens/mainpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        StreamProvider.value(
            value: DatabaseService().clientMasterStream,
            initialData: demoClientList),
        StreamProvider.value(
            value: DatabaseService().productMasterStream,
            initialData: demoProductList),
        StreamProvider.value(
            value: DatabaseService().clientProductMasterStream,
            initialData: demoClientProductList),
      ],
      child: MaterialApp(
        home: Mainpage(),
      ),
    ),
  );
}
