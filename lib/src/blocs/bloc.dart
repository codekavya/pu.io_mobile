import 'dart:async';

import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with ValidationMixin {
  final _email = StreamController<String>.broadcast();
  final _password = StreamController<String>.broadcast();

  //Add data to the stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  //Change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  //Delete sink
  dispose() {
    _email.close();
    _password.close();
  }
}
