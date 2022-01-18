import 'package:flutter/material.dart';

class FavoriteContact extends StatefulWidget {
  const FavoriteContact({Key? key}) : super(key: key);

  @override
  _FavoriteContactState createState() => _FavoriteContactState();
}

class _FavoriteContactState extends State<FavoriteContact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Danh sách yêu thích'),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
            ],
          ),
        ),
        Container(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage:
                          AssetImage("assets/images/download.jpeg"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("HienColor"),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
