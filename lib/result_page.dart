import 'package:flutter/material.dart';
import 'CustomCard.dart';
import 'constant.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.result});
  final String result = "sdghs";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  result,
                  style: kLargeButtonTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CustomCard(
                colour: Color(cardColor),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Result text",
                      style: kResultTextStyle,
                    ),
                    Text(
                      "Result text",
                      style: kBigFontStyle,
                    ),
                    Text(
                      "Result text",
                      style: kTextStyale,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
