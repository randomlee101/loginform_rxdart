import 'package:flutter/material.dart';
import 'package:loginform/input_field.dart';
import 'package:loginform/locator.dart';
import 'package:loginform/service.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppService appService;

  @override
  void initState() {
    appService = getIt.get<AppService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        elevation: 1,
      ),
      body: ListView(
        children: <Widget>[
          InputField(
            hint: "Username",
            func: appService.addUser,
            stream: appService.username,
          ),
          InputField(
            hint: "Password",
            func: appService.addPassword,
            stream: appService.password,
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: StreamBuilder<Object>(
                  stream: appService.isFormValid,
                  builder: (context, snapshot) {
                    return RaisedButton(
                      child: Text("Check Out"),
                      onPressed: snapshot.data == true ? () {
                        if (snapshot.data == true) {
                          print(true);
                        }
                      } : null,
                      color: Colors.teal,
                      disabledColor: Colors.teal[200],
                      disabledTextColor: Colors.white,
                      disabledElevation: 0.5,
                      animationDuration: Duration(milliseconds: 600),
                      textColor: Colors.white,
                    );
                  }))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    appService.dispose();
  }
}
