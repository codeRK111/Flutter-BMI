import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CustomCard.dart';
import 'iconComponent.dart';
import 'constant.dart';
import 'LargeButton.dart';
import 'result_page.dart';
import 'Calculator_brain.dart';

enum gender { male, female }
enum EToggle { increase, decrease }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool maleCardTapped = false;
  bool femaleCardTapped = false;
  int sliderValue = 180;
  int weight = 100;
  int age = 20;

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

  void toggleWeight(EToggle w) {
    setState(() {
      if (w == EToggle.increase) {
        weight++;
      } else if (w == EToggle.decrease) {
        weight--;
      }
    });
  }

  void toggleAge(EToggle w) {
    setState(() {
      if (w == EToggle.increase) {
        age++;
      } else if (w == EToggle.decrease) {
        age--;
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
                    Theme(
                      data: Theme.of(context).copyWith(
                          sliderTheme: Theme.of(context).sliderTheme.copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                              thumbColor: Color(bottomColor),
                              overlayColor: Color(0x29EB1555),
                              activeTrackColor: Colors.white)),
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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "weight",
                            style: kTextStyale,
                          ),
                          Text(
                            weight.toString(),
                            style: kBigFontStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CustomActionButton(
                                icon: Icons.add,
                                color: Colors.indigo,
                                onPress: () {
                                  toggleWeight(EToggle.increase);
                                },
                              ),
                              CustomActionButton(
                                icon: Icons.remove,
                                color: Colors.indigo,
                                onPress: () {
                                  toggleWeight(EToggle.decrease);
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      colour: Color(cardColor),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "age",
                            style: kTextStyale,
                          ),
                          Text(
                            age.toString(),
                            style: kBigFontStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CustomActionButton(
                                icon: Icons.add,
                                color: Colors.indigo,
                                onPress: () {
                                  toggleAge(EToggle.increase);
                                },
                              ),
                              CustomActionButton(
                                icon: Icons.remove,
                                color: Colors.indigo,
                                onPress: () {
                                  toggleAge(EToggle.decrease);
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            new LargeButton(
              name: 'CALCULATE',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(result: "abc")));
              },
            )
          ],
        ));
  }
}

class CustomActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function onPress;
  const CustomActionButton(
      {@required this.icon, this.color, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(width: 36.0, height: 36.0),
      padding: EdgeInsets.all(0.0),
      onPressed: onPress,
      shape: CircleBorder(),
      child: Icon(icon),
      fillColor: color,
      elevation: 5.0,
    );
  }
}
