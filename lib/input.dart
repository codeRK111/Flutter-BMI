import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomCard.dart';
import 'iconComponent.dart';
import 'constant.dart';

enum gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool maleCardTapped = false;
  bool femaleCardTapped = false;
  int sliderValue = 180;

  void onTapped(gender index) {
    setState(() {
      if (index == gender.male) {
        maleCardTapped = !maleCardTapped;
        femaleCardTapped = false;
      } else if (index == gender.female) {
        femaleCardTapped = !femaleCardTapped;
        maleCardTapped = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      colour: Color(maleCardTapped ? cardColor : inActiveColor),
                      cardChild: IconComponent(
                        icon: FontAwesomeIcons.mars,
                        text: "MALE",
                      ),
                      gestureTap: () {
                        onTapped(gender.male);
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      colour:
                          Color(femaleCardTapped ? cardColor : inActiveColor),
                      cardChild: IconComponent(
                        icon: FontAwesomeIcons.venus,
                        text: "FEMALE",
                      ),
                      gestureTap: () {
                        onTapped(gender.female);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                colour: Color(cardColor),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: kTextStyale,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(sliderValue.toString(), style: kBigFontStyle),
                        Text(
                          "cm",
                          style: kTextStyale,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          thumbColor: Color(bottomColor),
                          overlayColor: Color(0x29EB1555),
                          activeTrackColor: Colors.white),
                      child: Slider(
                        value: sliderValue.toDouble(),
                        max: 360.0,
                        min: 90.0,
                        //divisions: 4,

                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (value) {
                          setState(() {
                            sliderValue = value.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      colour: Color(cardColor),
                    ),
                  ),
                  Expanded(child: CustomCard(colour: Color(cardColor)))
                ],
              ),
            ),
            Container(
              color: Color(bottomColor),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            )
          ],
        ));
  }
}
