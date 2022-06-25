import 'package:attoform/models/client.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        client.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        client.email,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        launchUrlString('tel:${client.phoneNumber}');
                      },
                      icon: Icon(Icons.phone)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
