import 'package:flutter/material.dart';
import 'package:attoform/widget/notify_tile.dart';
import 'package:attoform/models/notification.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context,index){
            return NotifyTile(notification: notifications[index]);
          }
      )
    );
  }
}
