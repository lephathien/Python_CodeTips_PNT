import 'package:flutter/material.dart';

class RecentChat extends StatefulWidget {
  const RecentChat({Key? key}) : super(key: key);

  @override
  _RecentChatState createState() => _RecentChatState();
}

class _RecentChatState extends State<RecentChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.green,
                      backgroundImage:
                          AssetImage("assets/images/download.jpeg"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tên người chat",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: Text(
                            'nội dung chat hiển thị ở đây vui lòng nhấn vào đây',
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                              child: Text(
                            "10:30",
                          )),
                          Container(
                              height: 20,
                              width: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text("Mới",
                                  style: TextStyle(color: Colors.white))),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
