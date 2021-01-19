import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../component/SexWidget.dart';
import '../component/ReusableCard.dart';
import '../component/constant.dart';
import 'result_page.dart';
import '../bmi_Brain.dart';
import '../component/roundButton.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int sliderHeight = 170;
  int weight = 70;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                        onpress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        color: selectedGender == Gender.male
                            ? Color(0xFF1D1E33)
                            : Color(0xFF0A0E21),
                        containerChild: SexWidget(
                            sexIcon: FontAwesomeIcons.mars, sexType: "MALE")),
                  ),
                  Expanded(
                    child: ReusableCard(
                        onpress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        color: selectedGender == Gender.female
                            ? Color(0xFF1D1E33)
                            : Color(0xFF0A0E21),
                        containerChild: SexWidget(
                            sexIcon: FontAwesomeIcons.venus,
                            sexType: "FEMALE")),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: Color(0xFF1D1E33),
                containerChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: [
                        Text(
                          sliderHeight.toString(),
                          style: numberTextStyle,
                        ),
                        Text("cm")
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Colors.grey.shade600,
                          activeTrackColor: Colors.white,
                          thumbColor: Colors.pink,
                          overlayColor: Colors.pink.withOpacity(0.5),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10),
                          overlayShape:
                              RoundSliderThumbShape(enabledThumbRadius: 20)),
                      child: Slider(
                        value: sliderHeight.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            sliderHeight = newValue.round();
                          });
                        },
                        max: 220,
                        min: 120,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: Color(0xFF1D1E33),
                      containerChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT", style: labelTextStyle),
                          Text(weight.toString(), style: numberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: Color(0xFF1D1E33),
                      containerChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE", style: labelTextStyle),
                          Text(age.toString(), style: numberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(width: 10),
                              RoundButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                BmiBrain bmi = BmiBrain(sliderHeight, weight);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return ResultPage(
                    bmiResult: bmi.getBmiResult(),
                    resultText: bmi.getBmiText(),
                    interpretation: bmi.getInterpretation(),
                  );
                }));
              },
              child: Container(
                child: Center(
                  child: Text("CALCULATOR",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                margin: EdgeInsets.only(top: 10),
                height: 60,
                width: double.infinity,
                color: Color(0xFFEB1555),
              ),
            )
          ],
        ));
  }
}
