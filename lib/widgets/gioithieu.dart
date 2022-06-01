import 'package:flutter/material.dart';

class GioiThieiu extends StatefulWidget {
  const GioiThieiu({Key? key}) : super(key: key);

  @override
  State<GioiThieiu> createState() => _GioiThieiuState();
}

class _GioiThieiuState extends State<GioiThieiu> {
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
              "assets/images/s1.png",
            ),
          ],
        ),
      ),
    );
  }
}
