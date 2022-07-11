// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:ui';
import 'dart:async';
import 'package:day2/widgets/gioithieu.dart';
import 'package:day2/widgets/huongdansudung.dart';
import 'package:day2/widgets/phanhoi.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:day2/widgets/bangxephang.dart';
import 'package:day2/widgets/kt15lan2.dart';
import 'package:day2/widgets/ktgiuaky.dart';
import 'package:day2/widgets/python_codetip.dart';
import 'package:day2/widgets/python_nguphap.dart';
import 'package:day2/widgets/test15.dart';
import 'package:day2/widgets/kt15lan1.dart';
import 'package:day2/widgets/web_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String HoTen = '';
  String Lop = '';
  String DeThi = '';
  int _counter = 0;
  bool menuindex = true;
  int selectedindex = 0;
  final List<String> Categories = [
    "Code Tips",
    "Ngữ Pháp",
    "Kiểm tra Online",
    "Thực Thi",
  ];
  String dropdownValue = 'Chọn lớp';
  String dropdownValue1 = 'Chọn đề kiểm tra';
  dynamic Star = 3;

  void Kiemtra() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              //title: const Text("Alert Dialog title"),
              content: const Text(
                "Hãy nhập đầy đủ thông tin dự thi :  ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                FlatButton(
                  child: Center(
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (Text) {
                            HoTen = Text;
                          },
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Họ và tên học sinh',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 1,
                                color: Colors.black45,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                  Lop = newValue;
                                });
                              },
                              items: <String>[
                                'Chọn lớp',
                                'Lớp 11A4',
                                'Lớp 11A9',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            DropdownButton<String>(
                              value: dropdownValue1,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 1,
                                color: Colors.black45,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue1 = newValue!;
                                  DeThi = newValue;
                                });
                              },
                              items: <String>[
                                'Chọn đề kiểm tra',
                                'Kiểm tra 15 phút lần 1',
                                'Kiểm tra 15 phút lần 2',
                                'Kiểm tra giữa kỳ',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        RaisedButton.icon(
                          onPressed: () {
                            if (HoTen == "" ||
                                Lop == "" ||
                                DeThi == '' ||
                                DeThi == 'Chọn đề kiểm tra' ||
                                Lop == 'Chọn lớp') {
                            } else {
                              if (DeThi == "Kiểm tra 15 phút lần 1") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KiemTraLan1(
                                            HoTen.toString(),
                                            Lop.toString(),
                                            DeThi.toString())));
                              }
                              ;
                              if (DeThi == "Kiểm tra 15 phút lần 2") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KiemTraLan2(
                                            HoTen.toString(),
                                            Lop.toString(),
                                            DeThi.toString())));
                              }
                              ;
                              if (DeThi == "Kiểm tra giữa kỳ") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => KiemTraGKy(
                                            HoTen.toString(),
                                            Lop.toString(),
                                            DeThi.toString())));
                              }
                              ;
                            }
                          },
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              'Bắt đầu làm bài',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                          icon: const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                          ),
                          textColor: Colors.white,
                          splashColor: Colors.red,
                          color: Colors.green,
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  void DanhGia() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              //title: const Text("Alert Dialog title"),
              content: const Text(
                "Vui lòng đánh giá ứng dụng: ",
                style: TextStyle(fontSize: 15),
              ),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: RatingBar.builder(
                    initialRating: double.parse(Star.toString()),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      Star = rating;
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Center(
          child: Text(
            "PYTHON TIPS",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: DanhGia, icon: Icon(Icons.star)),
        ],
      ),
      drawerScrimColor: Colors.transparent,
      drawer: Container(
        width: 300,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Color.fromARGB(180, 250, 250, 250),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(31, 38, 135, 0.4),
                blurRadius: 8.0,
              )
            ],
            border: Border(
                right: BorderSide(
              color: Colors.white70,
            ))),
        child: Stack(
          children: [
            SizedBox(
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 4.0,
                    sigmaY: 4.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Colors.green.shade50,
                      Colors.green.shade100,
                    ])),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                DrawerHeader(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBbVDF_KQMR0txsNVVIhhWxUfnYRawJPK5pw&usqp=CAU"),
                        radius: 30.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text("Python Code Tips")
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GioiThieiu()));
                        },
                        leading: Icon(
                          Icons.smart_display,
                          color: Colors.black,
                        ),
                        title: Text("Giới thiệu phần mềm"),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HDSD()));
                        },
                        leading: Icon(
                          Icons.question_answer,
                          color: Colors.black,
                        ),
                        title: Text("Hướng dẫn sử dụng"),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhanHoi()));
                        },
                        leading: Icon(
                          Icons.mail,
                          color: Colors.black,
                        ),
                        title: Text("Góp ý - phản hồi"),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Colors.black,
                        ),
                        title: Text("Thoát"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 90,
            color: Colors.green,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedindex = index;
                      });
                      if (index == 3) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WebViewUI()));
                      }
                      ;
                      if (index == 0) {
                        setState(() {
                          menuindex = true;
                        });
                      }
                      ;
                      if (index == 1) {
                        setState(() {
                          menuindex = false;
                        });
                      }
                      ;

                      if (index == 2) {
                        Kiemtra();
                      }
                      ;
                    },
                    child: Text(
                      Categories[index],
                      style: TextStyle(
                          color: index == selectedindex
                              ? Colors.yellow
                              : Colors.white,
                          // color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow[50],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: BangXepHang()),
              Expanded(
                child: Container(
                  // height: 450,
                  color: Colors.white,
                  child: menuindex ? PythonCodeTip() : PythonNguPhap(),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
