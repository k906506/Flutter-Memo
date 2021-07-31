import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMemoScreen extends StatelessWidget {
  static const routeName = '/add-memo';
  final _titleController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("메모 등록"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "제목을 입력해주세요."),
                      textInputAction: TextInputAction.done,
                      controller: _titleController,
                    ),
                  ],
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
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.7,
                        ),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: TextField(
                          decoration: InputDecoration(labelText: "내용을 입력해주세요."),
                          maxLines: 10,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.multiline,
                          controller: _commentController,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
