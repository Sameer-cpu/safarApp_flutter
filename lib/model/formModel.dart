import 'package:flutter/cupertino.dart';
import 'package:safar_app/view/screens/signUpScreen.dart';

class FormModel {
  final String title;
  final String hintText;
  final widgetType type;
  final String imageUrl;
  final bool textBosecure;
  final TextInputType keyboardType;
  FormModel(
      {this.title = "",
      this.hintText = "",
      this.type = widgetType.Input,
      this.imageUrl = "",
      this.textBosecure = false,
      this.keyboardType = TextInputType.text});
}

List<Map<String, dynamic>> formJson = [
  {
    'title': "Sign up for Continue",
    "data": [
      FormModel(imageUrl: "assets/logo.png", type: widgetType.Image),
      FormModel(title: "Sign up for Continue", type: widgetType.Title),
      FormModel(
          keyboardType: TextInputType.name,
          hintText: "Name",
          title: "Enter your name",
          type: widgetType.Input),
      FormModel(
          keyboardType: TextInputType.emailAddress,
          title: "Email",
          hintText: "Enter Your Email Address",
          type: widgetType.Input),
      FormModel(
          keyboardType: TextInputType.number,
          title: "Phone number",
          hintText: "Enter Your Phone Number",
          type: widgetType.Input),
      FormModel(
          keyboardType: TextInputType.text,
          title: "Password",
          hintText: "Enter Your Password",
          textBosecure: true,
          type: widgetType.Input),
      FormModel(type: widgetType.Toggle)
    ]
  }
];
