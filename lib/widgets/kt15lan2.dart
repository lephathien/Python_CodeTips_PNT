import 'package:day2/widgets/ketquathi.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

class KiemTraLan2 extends StatefulWidget {
  final String HoTen;
  final String Lop;
  final String DeThi;

  const KiemTraLan2(this.HoTen, this.Lop, this.DeThi);
  // const TracNghiem({Key? key}) : super(key: key);

  @override
  State<KiemTraLan2> createState() => _TracNghiemState();
}

class _TracNghiemState extends State<KiemTraLan2> {
  int indexcauhoi = 0;
  int indexcautraloi = 0;

  dynamic DiemThi = 0;
  String indexdapan = "";

  bool DaClick = false;
  final List<String> CauHoi = [
    'Hoạt động nào sau đây lặp với số lần biết trước',
    'Rữa rau tới khi sạch',
    'Học bài tới khi thuộc',
    'Gọi điện cho tới khi bắt máy',
    'Ngày tắm hai lần',
    'Xác định số lần lặp cho bài toán tính tổng số nguyên từ 1 đến 100',
    '101',
    '100',
    '99',
    'Tất cả đều sai',
    'Đoạn chương trình sau đây lặp mấy lần?  a=1;  b=13 while a!=b : a=a + 1  b=b // 2  ',
    '1 lần ',
    '2 lần ',
    '3 lần ',
    '4 lần ',
    'Đoạn chương trình sau đây lặp mấy lần? for  i  in range(1,14,3)  :  print("Xin chào") ',
    '4 lần ',
    '5 lần ',
    '6 lần ',
    '7 lần ',
    'Vòng lặp sau đây sẽ kết thúc khi i=?  for i  in range(1,n+1) : print(i) ',
    'i=1 ',
    'i=n ',
    'i=n-1 ',
    'i=n+1 ',
    'Câu lệnh Python nào viết đúng? ',
    'For  i  in  range(1,10):  k=k+1 ',
    'B. for  i  in  range(1,10)   k=k+1     ',
    'for  i  in  range(1,10):  k==k+1            ',
    'for  i  in  range(1,10):  k=k+1 ',
    'Cú Pháp Vòng Lặp while có dạng:',
    'while <điều kiện>: <câu lệnh >',
    'while < câu lệnh >: < điều kiện >',
    'while <điều kiện>: <câu lệnh >:',
    'while < câu lệnh >: <điềukiện>:',
    '<Biến đếm> trong vòng lặp For thường là kiểu dữ liệu nào?',
    'Kiểu số thực',
    'Kiểu số nguyên',
    'Kiểu ký tự',
    'Tất cả đều sai',
    'Trong python, cấu trúc lặp có mấy loại?',
    ' 3 loại',
    ' 2 loại',
    ' 1 loại',
    ' 4 loại',
    'Vòng lặp While kết thúc khi nào?',
    'Khi điều kiện cho trước được thỏa mãn',
    'Khi đủ số vòng lặp',
    'Khi tìm được Output',
    'Tất cả phương án',
  ];

  final List<String> DapAn = [
    'D',
    'B',
    'B',
    'B',
    'D',
    'D',
    'A',
    'B',
    'B',
    'A',
  ];
  final List<String> ChonDapAn = [
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
    "0",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.DeThi),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/quiz.jpeg",
                height: 160,
              ),

              SizedBox(
                height: 0,
              ),
              Text(
                "Câu hỏi " +
                    (indexcautraloi + 1).toString() +
                    "/" +
                    (DapAn.length).toString() +
                    ": " +
                    CauHoi[indexcauhoi],
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                ///////////////////////////////////
                onTap: () {
                  setState(() {
                    ChonDapAn[indexcautraloi] = "A";
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ChonDapAn[indexcautraloi].toString() == "A"
                          ? Colors.green
                          : Colors.orange,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "A) " + CauHoi[indexcauhoi + 1],
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                //////////////////////
                onTap: () {
                  if (DaClick == false) {
                    setState(() {
                      ChonDapAn[indexcautraloi] = "B";
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ChonDapAn[indexcautraloi].toString() == "B"
                          ? Colors.green
                          : Colors.orange,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "B) " + CauHoi[indexcauhoi + 2],
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                ////////////////////////
                onTap: () {
                  setState(() {
                    ChonDapAn[indexcautraloi] = "C";
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ChonDapAn[indexcautraloi].toString() == "C"
                          ? Colors.green
                          : Colors.orange,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "C) " + CauHoi[indexcauhoi + 3],
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  //////////////////////////////
                  if (DaClick == false) {
                    setState(() {
                      ChonDapAn[indexcautraloi] = "D";
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ChonDapAn[indexcautraloi].toString() == "D"
                          ? Colors.green
                          : Colors.orange,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "D) " + CauHoi[indexcauhoi + 4],
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ////////////nút tới và lùi//////////
              SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton.icon(
                    onPressed: () {
                      setState(() {
                        if (indexcauhoi > 0) {
                          indexcauhoi = indexcauhoi - 5;
                          indexcautraloi = indexcautraloi - 1;
                        }
                      });
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    label: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: const Text(
                        'Quay lại',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    textColor: Colors.white,
                    splashColor: Colors.red,
                    color: Colors.green,
                  ),
                  RaisedButton.icon(
                    onPressed: () {
                      setState(() {
                        if (DapAn.length > indexcautraloi + 1) {
                          indexcauhoi = indexcauhoi + 5;
                          indexcautraloi = indexcautraloi + 1;
                        } else {
                          for (var i = 0; i < ChonDapAn.length; i++) {
                            if (ChonDapAn[i] == DapAn[i]) {
                              DiemThi = DiemThi + 1;
                            }
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KetQuaThi(
                                      widget.HoTen,
                                      widget.Lop,
                                      widget.DeThi,
                                      DiemThi.toString())));
                        }
                      });
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    label: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: const Text(
                        'Tiếp theo',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    textColor: Colors.white,
                    splashColor: Colors.red,
                    color: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
