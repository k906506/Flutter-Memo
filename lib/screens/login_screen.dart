import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.4,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.8,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "아이디를 입력해주세요.";
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return "비밀번호를 입력해주세요.";
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}