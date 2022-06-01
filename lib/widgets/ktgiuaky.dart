import 'package:day2/widgets/ketquathi.dart';
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

class KiemTraGKy extends StatefulWidget {
  final String HoTen;
  final String Lop;
  final String DeThi;

  const KiemTraGKy(this.HoTen, this.Lop, this.DeThi);
  // const TracNghiem({Key? key}) : super(key: key);

  @override
  State<KiemTraGKy> createState() => _TracNghiemState();
}

class _TracNghiemState extends State<KiemTraGKy> {
  int indexcauhoi = 0;
  int indexcautraloi = 0;

  dynamic DiemThi = 0;
  String indexdapan = "";

  bool DaClick = false;
  final List<String> CauHoi = [
    '  Trong ngôn ngữ lập trình Python, tên nào sau đây không đúng? ',
    'Ho+ten ',
    'Vi_du ',
    'Chuong_trinh ',
    'Giai_BT',
    ' Trong ngôn ngữ lập trình Python, biểu thức sau đây x= 15//2 có kết quả là:',
    '2',
    '1',
    '7',
    '7.5',
    ' Trong Python, biểu thức (20 // 6)+ (17 %4) cho kết quả là :',
    '1',
    '2',
    '3',
    '4',
    ' Trong ngôn ngữ lập trình Python, biểu thức x=(26%4)//2 có kết quả là:',
    '2',
    '3',
    '4',
    '1',
    ' Lệnh nhập dữ liệu nào sao đây là hợp lệ?',
    'a=input(Hãy nhập tên trường của bạn:)',
    'a=input‘Hãy nhập tên trường của bạn:’',
    'a=input(‘Hãy nhập tên trường của bạn:’)',
    'a=input(‘Hãy nhập tên trường của bạn:’);',
    ' Ký hiệu nào dùng để xác định khối lệnh trong Python?',
    '{ } ',
    '[ ]  ',
    'Thụt lề ',
    '( )',
    ' Đâu là phép toán quan hệ “khác” trong Python?',
    '><',
    '==',
    '!=',
    '<> ',
    ' Với x có giá trị bằng bao nhiêu thì biểu thức (x>0) and (x <= 6) and (x % 3==0) có giá trị True? ',
    'x=-6 ',
    'x=6 ',
    'x=2 ',
    'x=4',
    ' Trong ngôn ngữ lập trình Python, biểu thức nào sau đây là biểu thức logic?',
    'x+3',
    'x>3',
    'x>=3 and y<=2',
    'x=3',
    ' Cho biết kết quả in ra của đoạn chương trình sau trong Python khi nhập vào giá trị 19? a=float(input(‘Nhập a:’)    print(a)',
    '19',
    '19.0',
    '‘19’',
    '‘19.0’',
    ' Khẳng định nào là đúng về chú thích trong Python? ',
    'Để người viết code giao tiếp với người đọc code ',
    'Có thể được viết trên 1 dòng hoặc nhiều dòng ',
    'Chương trình dịch sẽ bỏ qua chú thích khi chạy ',
    'Tất cả đều đúng ',
    ' Kiểu dữ liệu chuẩn trong Python gồm',
    'int, float, real, bool  ',
    'int, float, str, bool ',
    'int, float, bool, char  ',
    'int, word, str, bool ',
    ' Câu lệnh gán  nào sau đây là hợp lệ trong Python?',
    'x=x * 2; ',
    'x=x + 1;',
    'x + y:=10;',
    'x=9',
    ' Cho các lệnh sau. Hỏi giá trị của y là?  x=5   y=x   x=10',
    'y=5',
    'y=15',
    'y=10',
    'y=20',
    ' Câu lệnh nhập dữ liệu nào sao đây là hợp lệ?',
    'a=input(Hãy nhập tên trường của bạn:)',
    'a=input(‘Hãy nhập tên trường của bạn’):',
    'a=input(‘Hãy nhập tên trường của bạn:’)',
    'a=input(‘Hãy nhập tên trường của bạn:’);',
    ' Trong python, cấu trúc rẽ nhánh có mấy loại?',
    '3 loại',
    '2 loại',
    '1 loại',
    '4 loại ',
    ' Câu lệnh đưa kết quả ra màn hình của phép toán  t=a+b là?',
    'print (tổng là,t)',
    'print (‘tổng là’,t)',
    'print (‘tổng là’,t):',
    'print (‘tổng là: t’)',
    ' Cú pháp của cấu trúc rẽ nhánh dạng thiếu là :',
    'A.if <điều kiện>: <câu lệnh>',
    'B. if <điều kiện>: <câu lệnh>:',
    'C. if<câu lệnh>: <điều kiện>',
    'D. if  <câu lệnh>: <điều kiện>: ',
    ' Để kết thúc một khối các câu lệnh trong phần thân của câu lệnh if, chúng ta dùng',
    'Dấu chấmphẩy',
    'Dấu đóng ngoặc nhọn',
    'end',
    'Một câu lệnh được thụt lùi',
    ' Trong câu lệnh If <điều kiện>:  thì <điều kiện> là :',
    'Biểu thức logic',
    'Biểu thức quan hệ',
    'Cả 2 đều sai',
    'Cả 2 đều đúng',
    "Kiểu thực trong Python:",
    "Sử dụng dấu . để ngăn cách phần thập phân",
    "Có tên đại diện là float",
    "Độ chính xác 15 chữ số phần thập phân",
    "Tất cả đều đúng ",
    '  <Biến đếm> trong vòng lặp For thường là kiểu dữ liệu nào?',
    'Kiểu số thực',
    'Kiểu số nguyên',
    'Kiểu ký tự',
    'Tất cả đều sai',
    ' Trong ngôn ngữ Python, hàm sqrt() dùng để:',
    'Tính lũy thừa ',
    'Tính căn bậc 2',
    'Tính giá trị tuyệt đối ',
    'Tính bình phương',
    ' Quy tắc đúng khi đặt tên trong Python: ',
    'Tên có thể bắt đầu bằng dấu _ ',
    'Tên có thể bắt đầu bằng chữ số  ',
    'Tên có thể sử dụng ký tự đặc biệt ',
    'Tên có thể đặt trùng với tên dành riêng',
    'Trường hợp nào sau đây là câu lệnh gán trong Python? ',
    'x==5',
    'x:x=x+1',
    'x+1',
    '1+=1',
  ];

  final List<String> DapAn = [
    'A',
    'C',
    'D',
    'D',
    'B',
    'C',
    'C',
    'B',
    'C',
    'B',
    'D',
    'B',
    'D',
    'A',
    'C',
    'B',
    'B',
    'B',
    'D',
    'D',
    'D',
    'B',
    'B',
    'A',
    'D',
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
                              DiemThi = DiemThi + 0.4;
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
