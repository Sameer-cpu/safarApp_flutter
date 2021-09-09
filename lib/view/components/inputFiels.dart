import 'package:flutter/material.dart';
import 'package:safar_app/model/constant.dart';

class InputField extends StatelessWidget {
  final String title;
  final String? Function(String?)? validator;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  InputField(
      {this.title = "",
      this.validator,
      this.hintText = "",
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title"),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            validator: this.validator,
            obscureText: obscureText,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: "$hintText",
                hintStyle: TextStyle(color: Color(0xFFA2A2A2)),
                enabledBorder: border,
                focusedBorder: border),
          ),
        ],
      ),
    );
  }
}
