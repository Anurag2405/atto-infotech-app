import 'package:attoform/models/client.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget {
  Client client;
  ClientCard({required this.client});
  //const ClientCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(client.name),
            SizedBox(height: 10),
            Text(client.dateOfExpiry),
            SizedBox(height: 20),
            Text(client.note)
          ],
        ),
      ),
    );
  }
}
