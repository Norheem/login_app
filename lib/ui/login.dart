// ignore_for_file: unnecessary_new, prefer_const_constructors, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = "";

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
      _welcomeString = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Login Form"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new Column(
          children: <Widget>[
            //Display Image
            new Image.asset(
              "images/face.png",
              width: 100.0,
              height: 100.0,
              color: Colors.lightGreen,
            ),

            //Login Form
            new Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 200.0,
                width: 400.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _userController,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Username",
                          icon: Icon(Icons.person)),
                    ),
                    new TextField(
                      controller: _passwordController,
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          icon: Icon(Icons.lock)),
                      obscureText: true,
                    ),
                    //new Padding(padding: new EdgeInsets.all(10.5)),
                    new Center(
                      child: new Row(children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left: 40.0),
                          child: new ElevatedButton(
                            onPressed: _showWelcome,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            child: new Text("Login"),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left: 200.0),
                          child: new ElevatedButton(
                            onPressed: _erase,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            child: new Text(
                              "Clear",
                              style: new TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ]),
                    )
                  ],
                )), //From ends here

            new Padding(padding: const EdgeInsets.all(15.0)),

            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Welcome $_welcomeString\n",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _welcomeString = _userController.text;
      } else {
        _welcomeString = "Nothing!";
      }
    });
  }
}
