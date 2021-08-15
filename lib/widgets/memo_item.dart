import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MemoItem extends StatelessWidget {
  String id;
  String title;
  String content;
  DateTime uploadDate;

  MemoItem(this.id, this.title, this.content, this.uploadDate);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(title),
          Text(
            DateFormat('MM월 dd일\nkk시 mm분').format(uploadDate),
          ),
        ],
      ),
    );
  }
}
