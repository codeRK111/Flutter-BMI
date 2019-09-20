import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function gestureTap;
  CustomCard({@required this.colour, this.cardChild, this.gestureTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureTap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
