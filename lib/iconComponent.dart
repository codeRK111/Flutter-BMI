import 'package:flutter/material.dart';
import 'constant.dart';

class IconComponent extends StatelessWidget {
  final String text;
  final IconData icon;
  IconComponent({@required this.text, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: kTextStyale,
        )
      ],
    );
  }
}
