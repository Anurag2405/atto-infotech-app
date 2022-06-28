import 'package:flutter/material.dart';
import 'package:attoform/widget/notify_card.dart';
import 'package:attoform/models/notification.dart';
import 'package:provider/provider.dart';
import 'package:attoform/models/clientprodmap.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    //final notificationList = Provider.of<List<Notify>>(context);
    final clientProductList = Provider.of<List<ClientProduct>>(context);

    List<ClientProduct> notificationList = [];
    for (int i = 0; i < clientProductList.length; i++) {
      //print(DateTime.parse(clientProductList[i].dateOfExpiry));
      //DateTime.parse(clientProductList[i].dateOfExpiry)

      if (DateTime.parse(clientProductList[i].dateOfExpiry)
              .difference(DateTime.now()) <
          Duration(days: 7)) {
        notificationList.add(clientProductList[i]);
      }
    }

    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('Notifications'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
        ),
        body: ListView.builder(
            itemCount: notificationList.length,
            itemBuilder: (context, index) {
              return NotifyTile(notification: notificationList[index]);
            }));
  }
}
