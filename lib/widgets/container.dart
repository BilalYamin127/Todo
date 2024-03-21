import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CusotmContainer extends StatelessWidget {
  CusotmContainer(
      {super.key,
      required this.count,
      required this.icon,
      required this.title,
      required this.color});
  String title;
  int count;
  Icon icon;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 170,
      color: color,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                ),
                SizedBox(
                  width: 100,
                ),
                Text('$count'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
