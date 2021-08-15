import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/memo_provider.dart';
import '/models/memo.dart';


class AddMemoScreen extends StatelessWidget {
  static const routeName = '/add-memo';

  final formKey = GlobalKey<FormState>();

  Memo _addMemo = new Memo(
    "",
    "",
    "",
    DateTime.now(),
  );

  void _saveMemo(BuildContext context) {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      formKey.currentState!.save();
      Provider.of<MemoProvider>(context,listen: false).addMemo(_addMemo.title, _addMemo.content);
      Navigator.of(context).pop();
    } else {
      // Scaffold.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("입력 값을 확인해주세요."),
      //   ),
      // );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("메모 등록"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _saveMemo(context);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
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
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: "제목을 입력해주세요."),
                      textInputAction: TextInputAction.next,
                      onSaved: (value) {
                        _addMemo = Memo(_addMemo.id, value.toString(), _addMemo.content,
                            _addMemo.uploadDate);
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "제목은 필수사항입니다.";
                        }
                      },
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
                height: 10,
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
                        padding: const EdgeInsets.all(8),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "내용을 입력해주세요.",
                              border: InputBorder.none),
                          maxLines: null,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.multiline,
                          onSaved: (value) {
                            _addMemo = Memo(_addMemo.id, _addMemo.title, value.toString(),
                                _addMemo.uploadDate);
                          },
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "내용은 필수사항입니다.";
                            }
                          },
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
