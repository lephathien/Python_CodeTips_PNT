import 'package:flutter/material.dart';

class HDSD extends StatefulWidget {
  const HDSD({Key? key}) : super(key: key);

  @override
  State<HDSD> createState() => _HDSDState();
}

class _HDSDState extends State<HDSD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Giới thiệu ứng dụng"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/s2.png",
            ),
            Image.asset(
              "assets/images/s3.png",
            ),
            Image.asset(
              "assets/images/s4.png",
            ),
            Image.asset(
              "assets/images/s5.png",
            ),
            Image.asset(
              "assets/images/s6.png",
            ),
          ],
        ),
      ),
    );
  }
}
