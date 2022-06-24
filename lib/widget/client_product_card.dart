import 'package:attoform/models/client.dart';
import 'package:attoform/models/clientprodmap.dart';
import 'package:flutter/material.dart';

class ClientProductCard extends StatelessWidget {
  ClientProduct clientProduct;
  ClientProductCard({required this.clientProduct});
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
                  clientProduct.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  clientProduct.dateOfExpiry,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 20),
                Text(clientProduct.note)
              ],
            ),
            Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue[100],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(clientProduct.product),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
