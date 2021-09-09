import 'package:flutter/material.dart';
import 'package:safar_app/model/constant.dart';
import 'package:safar_app/model/firebaseMeths.dart';
import 'package:safar_app/view/components/button.dart';
import 'package:safar_app/view/components/inputFiels.dart';
import 'package:safar_app/view/screens/homeScreen.dart';
import 'package:safar_app/view/screens/signinScreen.dart';

enum widgetType { Input, Image, Title, Toggle }

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");

  FirebaseMethds _firebaseMethds = FirebaseMethds();

  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50.0),
            alignment: Alignment.center,
            child: Image(
              image: AssetImage("assets/logo.png"),
              width: logoSize,
              height: logoSize,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 23, top: 40),
            child: Text(
              "Sign up for Continue",
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0),
            ),
          ),
          Column(children: [
            InputField(
              keyboardType: TextInputType.name,
              title: "Enter your Name",
              hintText: "Name",
            ),
            InputField(
              keyboardType: TextInputType.name,
              title: "Email",
              hintText: "Enter Your Email Address",
              controller: email,
            ),
            InputField(
              keyboardType: TextInputType.name,
              title: "Phone Number",
              hintText: "Enter your phone Number",
            ),
            InputField(
              keyboardType: TextInputType.name,
              title: "Password",
              hintText: "Enter Your Pssword",
              obscureText: true,
              controller: password,
            ),
          ]),
          Button(
            color: primeryColor,
            title: "SignUp",
            onPressed: () {
              if (email.text.isNotEmpty && password.text.isNotEmpty) {
                _firebaseMethds.signUp(
                    email: email.text,
                    password: password.text,
                    context: context);
              }
            },
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Account? ",
                    style: TextStyle(color: Color(0xFF766F6F), fontSize: 12),
                  ),
                  Text(
                    " SignIn",
                    style: TextStyle(
                        color: Color(0xFF007CC1),
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
