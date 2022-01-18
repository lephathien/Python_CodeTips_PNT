import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedindex = 0;
  final List<String> Categories = ["Tin nhắn", "Online", "Nhóm", "Liên hệ"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
              Categories[index],
              style: TextStyle(
                  //color: (index == selectedindex)! Colors.white : Colors.white60,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
