import 'package:flutter/material.dart';

class BangXepHang extends StatefulWidget {
  const BangXepHang({Key? key}) : super(key: key);

  @override
  _FavoriteContactState createState() => _FavoriteContactState();
}

class _FavoriteContactState extends State<BangXepHang> {
  final List<String> NNLT = [
    "Python",
    "Java",
    "JVScript",
    "C++",
    "C#",
    "PHP",
    "HTML",
    "Ruby",
    "CSS",
    "Swift",
    "SQL",
    "MySQL",
  ];
  final List<String> NNLTImage = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
    "assets/images/9.png",
    "assets/images/10.png",
    "assets/images/11.png",
    "assets/images/12.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '** Các ngôn ngữ lập trình được yêu thích nhất **',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.orange,
                  )),
            ],
          ),
        ),
        Container(
          height: 85,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: NNLT.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(NNLTImage[index]),
                      //foregroundColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(NNLT[index]),
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
