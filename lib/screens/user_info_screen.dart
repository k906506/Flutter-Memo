import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  static const routeName = '/userinfo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("회원정보 수정"),
      ),
    );
  }
}
