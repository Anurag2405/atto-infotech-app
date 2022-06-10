import 'package:attoform/models/client.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget {
  Client client;
  ClientCard({required this.client});
  //const ClientCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  client.name,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(client.dateOfExpiry,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                SizedBox(height: 20),
                Text(client.note)
              ],
            ),
            Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blueGrey[100],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(client.service),
                )),
          ],
        ),
      ),
    );
  }
}
