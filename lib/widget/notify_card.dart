import 'package:attoform/models/clientprodmap.dart';
import 'package:flutter/material.dart';

class NotifyTile extends StatelessWidget {
  // const NotifyTile({Key? key}) : super(key: key);
  ClientProduct notification;
  NotifyTile({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(7),
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.name,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("Expires on: "),
                    Text(
                      notification.dateOfExpiry.substring(0, 10),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blueGrey[100],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(notification.product),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
