import 'package:flutter/material.dart';
import 'package:safar_app/model/constant.dart';

class Button extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color color;
  final VoidCallback? onPressed;
  Button(
      {this.title = "",
      this.icon,
      this.color = Colors.lightBlue,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: onPressed,
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
                  color: white,
                ),
                Text(
                  "$title",
                  style: TextStyle(color: white),
                )
              ],
            )
          : Text(
              "$title",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
    );
  }
}
