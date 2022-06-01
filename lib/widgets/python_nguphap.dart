import 'package:day2/widgets/content_nguphap.dart';
import 'package:flutter/material.dart';

class PythonNguPhap extends StatefulWidget {
  const PythonNguPhap({Key? key}) : super(key: key);

  @override
  State<PythonNguPhap> createState() => _PythonNguPhapState();
}

class _PythonNguPhapState extends State<PythonNguPhap> {
  final List<String> NguPhap = [
    "Khai báo biến",
    "Các phép toán số học",
    "Nhập xuất dữ liệu",
    "Câu lệnh rẽ nhánh If",
    "Câu lệnh lặp For",
    "Câu lệnh lặp While",
    "Chương trình con",
    "Kiểu xâu",
    "Kiểu dữ liệu danh sách",
  ];
  final List<String> urlimage = [
    "assets/images/khaibaobien.png",
    "assets/images/PhepToanSoHoc.png",
    "assets/images/NhapXuatDuLieu.png",
    "assets/images/CauLenhReNhanh.png",
    "assets/images/VongLapFor.png",
    "assets/images/VongLapWhile.png",
    "assets/images/ChuongTrinhCon.png",
    "assets/images/XauKyTu.png",
    "assets/images/DanhSach.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: NguPhap.length,
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
                      radius: 20,
                      backgroundColor: Colors.green,
                      backgroundImage: AssetImage("assets/images/learning.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("NGỮ PHÁP " + (index + 1).toString(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: Text(
                            NguPhap[index].toString(),
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ContentNguPhap(
                                          urlimage[index].toString())));
                            },
                            child: Container(
                                height: 30,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text("Xem",
                                    style: TextStyle(color: Colors.white))),
                          ),
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
