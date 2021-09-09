import 'package:flutter/material.dart';
import 'package:safar_app/model/constant.dart';
import 'package:safar_app/model/firebaseMeths.dart';
import 'package:safar_app/view/components/button.dart';
import 'package:safar_app/view/components/inputFiels.dart';
import 'package:safar_app/view/screens/signUpScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  FirebaseMethds _firebaseMethds = FirebaseMethds();
  TextEditingController email = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
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
            InputField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              title: "Email",
              hintText: "Enter Your Email Address",
              // obscureText: item.textBosecure,
            ),
            InputField(
              controller: password,
              keyboardType: TextInputType.emailAddress,
              title: "Password",
              hintText: "Enter Your Password",
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Color(0xff7E83AB)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(color: Color(0xff7E83AB)),
                  ),
                ),
              ],
            ),
            Button(
              color: primeryColor,
              title: "SignIn",
              onPressed: () {
                _firebaseMethds.signIn(
                    context: context,
                    email: email.text,
                    password: password.text);
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Flexible(
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    "or",
                    style: TextStyle(fontSize: 18, color: Color(0xff737373)),
                  ),
                  Flexible(
                    child: Divider(
                      indent: 10,
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            Button(
              icon: Icons.facebook,
              color: Color(0xFF3B5998),
              title: "Continue with Facebook",
              onPressed: () {
                _firebaseMethds.signIn(
                    email: email.text, password: password.text);
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Button(
                icon: Icons.g_mobiledata_rounded,
                color: Color(0xFF4285F4),
                title: "Continue with Google",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
