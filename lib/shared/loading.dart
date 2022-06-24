import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Container(
                child: Image.asset('assets/logo.png')),
          ),
          SpinKitWave(
            color: Colors.green,
            size: 50.0,
          ),
        ],
      ),
    );
  }
}