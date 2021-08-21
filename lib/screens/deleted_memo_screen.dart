import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/models/memo.dart';

class DeletedMemoScreen extends StatefulWidget {
  static const routeName = '/deleted-memo';

  @override
  _DeletedMemoScreenState createState() => _DeletedMemoScreenState();
}

class _DeletedMemoScreenState extends State<DeletedMemoScreen> {
  final formKey = GlobalKey<FormState>();

  Memo _deletedMemo = new Memo(
    "",
    "",
    "",
    DateTime.now(),
  );

  @override
  void didChangeDependencies() {
    final arguments = ModalRoute.of(context).settings.arguments as Memo;
    _deletedMemo.id = arguments.id;
    _deletedMemo.title = arguments.title;
    _deletedMemo.content = arguments.content;
    _deletedMemo.uploadDate = arguments.uploadDate;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("삭제된 메모 확인"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "제목",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    _deletedMemo.title,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "내용",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    _deletedMemo.content,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "등록 일자",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    DateFormat('yyyy년 MM월 dd일 kk시 mm분')
                        .format(_deletedMemo.uploadDate),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
