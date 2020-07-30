import 'package:loginform/validation.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class AppService with Validation{
  BehaviorSubject<String> _username = BehaviorSubject<String>();
  BehaviorSubject<String> _password = BehaviorSubject<String>();

  Stream<String> get username => _username.stream.transform(validateUsername);
  Stream<String> get password => _password.stream.transform(validatePassword);

  addUser(String value) { _username.sink.add(value); printin(value);}
  addPassword(String value) { _password.sink.add(value); printin(value);}

  Stream<bool> get isFormValid => Rx.combineLatest([username, password], (values) => true);

  printin(String v) {
    print(v);
  }

  dispose()
  {
    _username?.drain();
    _password?.drain();

    _username?.close();
    _password?.close();
  }

}
