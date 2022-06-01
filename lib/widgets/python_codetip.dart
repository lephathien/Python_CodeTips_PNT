import 'package:day2/widgets/python_thucthi.dart';
import 'package:flutter/material.dart';

class PythonCodeTip extends StatefulWidget {
  const PythonCodeTip({Key? key}) : super(key: key);

  @override
  _RecentChatState createState() => _RecentChatState();
}

class _RecentChatState extends State<PythonCodeTip> {
  final List<String> Tip = [
    "Khai báo biến đơn",
    "Khai báo nhiều biến",
    "Thực hiện phép toán cộng",
    "Thực hiện phép toán nhân",
    "Thực hiện phép toán chia",
    "Thực hiện phép chia lấy phần dư",
    "Thực hiện phép chia lấy phần nguyên",
    "Thực hiện phép toán lũy thừa",
    "Tính giá trị nhỏ nhất, lớn nhất",
    "Tính giá trị căn bậc 2 ",
    "Chuyển các kiểu dữ liệu số",
    "Xuất dữ liệu số ngẫu nhiên",
    "Xuất 1 phần tử chuỗi ký tự String",
    "Xuất dãy chuổi ký tự String",
    "Xuất chiều dài chuỗi String",
    "Thay thế chuỗi String",
    "Tách chuỗi String thành List",
    "Xuất các phần tử danh sách List",
    "Xuất chiều dài danh sách List",
    "Xuất phần tử tại vị trí danh sách List ",
    "Thêm phần tử vào danh sách List",
    "Xóa phần tử khỏi danh sách List",
    "Xóa cả danh sách List",
    "Sắp xếp phần tử trong danh sách List",
    "Gộp các danh sách List",
    "Hàm điều kiện If ",
    "Hàm điều kiện If.. else",
    "Hàm điều kiện If...elif...else",
    "Hàm điều kiện If + And",
    "Hàm điều kiện If + Or",
    "Vòng lặp While",
    "Vòng lặp while + Break",
    "Vòng lặp While + Continue",
    "Vòng lặp For",
    "Vòng lặp For + Break",
    "Vòng lặp For + Continue",
    "Hàm Funtion đơn giản",
    "Hàm Funtion trả về dữ liệu",
    "Biến toàn cục ngoài Hàm Funtion",
    "Biến toàn cục trong hàm Funtion",
  ];
  final List<String> Tipurl = [
    "https://www.w3schools.com/python/trypython.asp?filename=demo_variables1",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_variables8",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_oper_ass2",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_oper_ass4",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_oper_ass5",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_oper_ass6",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_oper_ass7",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_oper_ass8",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_math_min_max",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_math_sqrt",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_numbers_convert",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_numbers_random",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_string1",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_for_string",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_string_len",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_string_replace",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_string_split",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_list",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_list_len",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_list_range",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_list_insert",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_list_remove",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_list_clear",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_list_sort_num",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_list_concat1",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_if2",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_if_else2",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_if_else",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_if_and",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_if_or",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_while",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_while_break",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_while_continue",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_for_range2",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_for_break",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_for_continue",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_function_param",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_function_return",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_variables_global2",
    "https://www.w3schools.com/python/trypython.asp?filename=demo_variables_global4",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: Tip.length,
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
                      backgroundImage: AssetImage("assets/images/sangtao.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("TIP " + (index + 1).toString(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: Text(
                            Tip[index],
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
                                      builder: (context) => Python_ThucThi(
                                          Tipurl[index].toString(),
                                          Tip[index].toString())));
                            },
                            child: Container(
                                height: 30,
                                width: 50,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Text("Code",
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
