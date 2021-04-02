import 'dart:async';
import 'package:http/http.dart' as http;
import 'validators.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:puio_mobile/Screens/dashboard/dashboard.dart';

const url = 'http://localhost:4000/login';

class Bloc extends Object with ValidationMixin {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //Add data to the stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  //Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  Future submit() async {
    final validEmail = _email.value;
    final validPassword = _password.value;
    var url = Uri.parse('http://10.0.2.2:4000/signin');

    final response = await http
        .post(url, body: {'Email': validEmail, 'Password': validPassword});
    print('Email is $validEmail');
    print('Password is $validPassword');

    final parsed = jsonDecode(response.body);
    final token = parsed['token'];
    print(token);
    return token;
  }

  //Delete sink
  dispose() {
    _email.close();
    _password.close();
  }
}
