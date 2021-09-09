import 'package:flutter/material.dart';
import 'package:safar_app/model/constant.dart';

class SelectedCards extends StatelessWidget {
  final String path;
  final String title;
  final String subTitle;
  final String timeText;
  final VoidCallback? onTab;
  SelectedCards(
      {this.path = "",
      this.title = "",
      this.subTitle = "",
      this.timeText = "",
      this.onTab});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(150))),
        child: Card(
          color: primeryColor,
          child: Container(
            // height: 150,
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset(
                  "$path",
                  width: 68.0,
                ),
                Text("$title",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18)),
                SizedBox(
                  height: 2,
                ),
                Text("$subTitle",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 16)),
                Container(
                    margin: EdgeInsets.only(top: 23.0),
                    padding: EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text("$timeText", style: ktimingStyling)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SpecificSelectedCard extends StatelessWidget {
  final String path;
  final String title;
  final String subTitle;
  final String timeText;
  SpecificSelectedCard({
    this.path = "",
    this.title = "",
    this.subTitle = "",
    this.timeText = "",
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "$path",
                  width: 100.0,
                ),
                Text("$title",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 18)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("Test"),
                Text(
                  "total: $subTitle",
                  style: TextStyle(fontSize: 14.0),
                ),
                Container(
                    margin: EdgeInsets.only(top: 23.0),
                    padding: EdgeInsets.all(7.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFA2A2A2),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text("$timeText",
                        style: TextStyle(color: white, fontSize: fontSize_2))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
