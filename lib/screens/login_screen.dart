import 'package:flutter/material.dart';
import 'package:fluttermemo/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

  void _saveInfo() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Provider.of<AuthProvider>(context, listen: false).login(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null) {
                      return "이메일을 입력해주세요.";
                    }
                  },
                  onSaved: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null) {
                      return "비밀번호를 입력해주세요.";
                    }
                  },
                  onSaved: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  onPressed: () {
                    _saveInfo();
                  },
                  child: Text("로그인"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
