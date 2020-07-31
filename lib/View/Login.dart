import 'package:exameflutter/View/Converter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.yellow[700],
      ),
      body: Container(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: Get.height * 0.02),
              width: Get.width * 0.9,
              child: TextFormField(
                cursorColor: Colors.black87,
                textInputAction: TextInputAction.done,
                onChanged: (text) {},
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.yellow[700])),
                    labelText: 'Username or Email ',
                    labelStyle: TextStyle(color: Colors.black87),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(color: Colors.yellow[700]))),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: Get.height * 0.02),
              width: Get.width * 0.9,
              child: TextFormField(
                cursorColor: Colors.black87,
                textInputAction: TextInputAction.done,
                onChanged: (text) {},
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: Colors.yellow[700])),
                    labelText: 'Password ',
                    labelStyle: TextStyle(color: Colors.black87),
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                        borderSide: new BorderSide(color: Colors.yellow[700]))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Get.width * 0.9,
                color: Colors.yellow[700],
                child: FlatButton(
                    child: Text(
                      "LOG IN",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Get.to(Converter());
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Get.height * 0.03, bottom: Get.height * 0.03),
              child: Center(
                child: Text("OR"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Get.width * 0.9,
                color: Colors.grey[700],
                child: FlatButton(
                    child: Text(
                      "LOGIN WITH FACEBOOK",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Get.width * 0.9,
                color: Colors.blueGrey,
                child: FlatButton(
                  
                    child: Text(
                      "LOGIN WITH TWITTER",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Get.width * 0.9,
                color: Colors.blueGrey[200],
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "LOGIN WITH GOOGLE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
