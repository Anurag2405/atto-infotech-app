import 'package:attoform/models/client.dart';
import 'package:flutter/material.dart';

class ClientMap extends StatelessWidget {
  Client client;
  ClientMap({required this.client});
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    client.name,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
