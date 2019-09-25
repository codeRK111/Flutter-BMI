import 'package:flutter/material.dart';
import 'constant.dart';

class LargeButton extends StatelessWidget {
  final String name;
  final Function onTap;

  LargeButton({@required this.name, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/result');
      },
      child: Container(
        child: Center(
          child: Text(
            "CALCULATE",
            style: kLargeButtonTextStyle,
          ),
        ),
        color: Color(bottomColor),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
