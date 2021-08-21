import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthProvider with ChangeNotifier {
  String _token;
  String _email;

  String get token {
    return _token;
  }

  String get email {
    return _email;
  }

  bool get isAuth {
    return _token != null;
  }

  Future<void> _authenticate(String email, String password, String type) async {
    final url = Uri.parse(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/$type?key=AIzaSyCguWvgB0Yts9C0vlpzbtJou2Tk_FFW9Us');
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(response.body);
  }
}
