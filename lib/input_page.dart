import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/style.dart';
import 'gender_buttons.dart';
import 'glass_container.dart';
import 'user_data.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? selectedGender;
  double dosport = 5.0;
  double smoke = 15.0;
  int height = 170;
  int weight = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Image.network(
                'https://content.thriveglobal.com/wp-content/uploads/2018/03/Blog_9_Ways_to_Take_Responsiblity_for_Your_Life.jpeg',
                fit: BoxFit.cover,
                height: double.infinity,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GlassContainer(
                            child: methodHeightWeight('HEIGHT'),
                          ),
                        ),
                        Expanded(
                          child: GlassContainer(
                            child: methodHeightWeight('WEIGHT'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GlassContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'How many days a week do you exercise?',
                            style: ktextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            dosport.round().toString(),
                            style: knumberStyle,
                          ),
                          Slider(
                            activeColor: Colors.white,
                            min: 0,
                            max: 10,
                            divisions: 10,
                            value: dosport,
                            onChanged: (double newvalue) {
                              setState(() {
                                dosport = newvalue;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GlassContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'How many cigarettes do you smoke a day?',
                            style: ktextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            smoke.round().toString(),
                            style: knumberStyle,
                          ),
                          Slider(
                            activeColor: Colors.white,
                            min: 0,
                            max: 30,
                            value: smoke,
                            onChanged: (double newvalue) {
                              setState(() {
                                smoke = newvalue;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 'FEMALE';
                              });
                            },
                            child: GlassContainer(
                              blur: selectedGender == 'FEMALE' ? 100 : 2,
                              child: GenderButtons(
                                icon: FontAwesomeIcons.venus,
                                gender: 'FEMALE',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = 'MALE';
                              });
                            },
                            child: GlassContainer(
                              blur: selectedGender == 'MALE' ? 100 : 2,
                              child: GenderButtons(
                                icon: FontAwesomeIcons.mars,
                                gender: 'MALE',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              userData: UserData(
                                selectedGender: selectedGender,
                                dosport: dosport,
                                smoke: smoke,
                                height: height,
                                weight: weight,
                              ),
                            ),
                          ),
                        );
                      },
                      child: GlassContainer(
                        child: Center(
                          child: Text(
                            'CALCULATE',
                            textAlign: TextAlign.center,
                            style: ktextStyle,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row methodHeightWeight(String label) {
    return Row(
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label,
            style: ktextStyle,
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label == 'HEIGHT' ? height.toString() : weight.toString(),
            style: knumberStyle,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  label == 'HEIGHT' ? height++ : weight++;
                });
              },
              icon: Icon(
                FontAwesomeIcons.circlePlus,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  label == 'HEIGHT' ? height-- : weight--;
                });
              },
              icon: Icon(
                FontAwesomeIcons.circleMinus,
                size: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
