import 'package:flutter/material.dart';

class ContentNguPhap extends StatefulWidget {
  final String urlimage;
  const ContentNguPhap(this.urlimage);
  //const ContentNguPhap({Key? key}) : super(key: key);

  @override
  State<ContentNguPhap> createState() => _ContentNguPhapState();
}

class _ContentNguPhapState extends State<ContentNguPhap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset(widget.urlimage.toString()),
            ],
          )),
    );
  }
}
