import 'package:day2/widgets/ketquathi.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

class KiemTraLan1 extends StatefulWidget {
  final String HoTen;
  final String Lop;
  final String DeThi;

  const KiemTraLan1(this.HoTen, this.Lop, this.DeThi);
  // const TracNghiem({Key? key}) : super(key: key);

  @override
  State<KiemTraLan1> createState() => _TracNghiemState();
}

class _TracNghiemState extends State<KiemTraLan1> {
  int indexcauhoi = 0;
  int DiemThi = 0;
  String indexdapan = "";

  bool DaClick = false;
  final List<String> CauHoi = [
    "Biểu thức (17 // 3) + (2 % 4) cho kết quả?",
    "Chú thích trong Python được bắt đầu bởi ký tự: ? ",
    "Để in dữ liệu ta dùng hàm gì?",
    "Trong ngôn ngữ lập trình Python, biểu thức sau đây x= 15%2 có kết quả là:?",
    "Trong ngôn ngữ lập trình Python, biểu thức nào sau đây là biểu thức quan hệ?",
    "Trong các kiểu dữ liệu sau đây kiểu nào là số nguyên?",
    "Kiểu dữ liệu sau là kiểu dữ liệu gì?  n='12345'",
    "Đâu là phép toán quan hệ “so sánh bằng” trong Python?",
    "Khẳng định nào đúng về Python?",
    "Biểu thức toán học 5a-(2b+3) trong Pyhton là?",
  ];
  final List<String> CauTraLoiA = [
    "6 ",
    "* hoặc # ",
    "Input",
    "7.5",
    "x+2",
    "int",
    "Số nguyên",
    "=",
    "Là ngôn ngữ lập trình bậc cao",
    "5a-(2b+3)",
  ];
  final List<String> CauTraLoiB = [
    "7",
    "# hoặc { ",
    "Print",
    "1",
    "x>2",
    "float",
    "Số thực",
    "==",
    "Là một ngôn ngữ thông dịch",
    "5*a-(2*b+3)",
  ];
  final List<String> CauTraLoiC = [
    "8",
    "# , 3 nháy đơn hoặc 3 nháy kép ",
    "Out",
    "2",
    "x>2 and y<1",
    "Bool",
    "Chuỗi ký tự",
    "<>",
    "Là ngôn ngữ lập trình hướng đối tượng",
    "5*a-(2b+3)",
  ];
  final List<String> CauTraLoiD = [
    "9",
    " * hoặc @ ",
    "In",
    "7",
    "2",
    "Str",
    "Logic",
    ">=",
    "Cả 3 đều đúng",
    "5a-(2*b+3)",
  ];
  final List<String> DapAn = [
    "B",
    "C",
    "B",
    "B",
    "D",
    "A",
    "C",
    "B",
    "D",
    "B",
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
  void KetquaDung() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          //title: const Text("Alert Dialog title"),
          content: Text(
            "BẠN TRẢ LỜI ĐÚNG RỒI! ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  void KetquaDSai() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          //title: const Text("Alert Dialog title"),
          content: Text(
            "BẠN TRẢ LỜI SAI RỒI! ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.DeThi),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
                    (indexcauhoi + 1).toString() +
                    "/" +
                    CauHoi.length.toString() +
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
                    ChonDapAn[indexcauhoi] = "A";
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ChonDapAn[indexcauhoi].toString() == "A"
                          ? Colors.green
                          : Colors.orange,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "A) " + CauTraLoiA[indexcauhoi],
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
                      ChonDapAn[indexcauhoi] = "B";
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ChonDapAn[indexcauhoi].toString() == "B"
                          ? Colors.green
                          : Colors.orange,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "B) " + CauTraLoiB[indexcauhoi],
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
                    ChonDapAn[indexcauhoi] = "C";
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ChonDapAn[indexcauhoi].toString() == "C"
                          ? Colors.green
                          : Colors.orange,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "C) " + CauTraLoiC[indexcauhoi],
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
                      ChonDapAn[indexcauhoi] = "D";
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ChonDapAn[indexcauhoi].toString() == "D"
                          ? Colors.green
                          : Colors.orange,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "D) " + CauTraLoiD[indexcauhoi],
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
                          indexcauhoi = indexcauhoi - 1;
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
                        if (CauHoi.length > indexcauhoi + 1) {
                          indexcauhoi = indexcauhoi + 1;
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
