import 'package:attoform/screens/formpage.dart';
import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Home page"),
            InkWell(
              child: Container(
                color: Colors.grey[200],
                width: 170,
                height: 170,
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Infoform()));
              },
            )
          ],
        ),
      ),
    );
  }
}
