import 'dart:async';

mixin Validation {
  final validateUsername =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    int len = value.length;

    if (len < 6) {
      sink.addError("Username is too short");
    } else {
      sink.add(value);
    }
  });
  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    int len = value.length;

    if (len < 6) {
      sink.addError("Password should be more than 6 characters");
    } else {
      sink.add(value);
    }
  });
}
