import 'package:flutter/material.dart';

class InputField<T> extends StatefulWidget {
  final Stream<T> stream;
  final Function func;
  final String hint;

  InputField({this.stream, this.func, this.hint});
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: StreamBuilder(
          stream: widget.stream,
          builder: (context, snapshot) {
            return TextFormField(
              onChanged: widget.func,
              decoration: InputDecoration(
                hintText: widget.hint,
                errorText: snapshot.error
              ),
              obscureText: widget.hint.toLowerCase() == "password" ? true : false,
            );
          }),
    );
  }
}
