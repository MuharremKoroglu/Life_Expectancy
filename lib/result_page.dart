import 'package:flutter/material.dart';
import 'package:life_expectancy/calculator.dart';
import 'package:life_expectancy/glass_container.dart';
import 'package:life_expectancy/style.dart';
import 'package:life_expectancy/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData userData;
  ResultPage({required this.userData});

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
                  SizedBox(
                    height: 100,
                  ),
                  Expanded(
                    flex: 3,
                    child: GlassContainer(
                      child: Center(
                        child: Text(
                          Calculate(userData: userData)
                              .calculator()
                              .round()
                              .toString(),
                          style: knumberStyle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 250,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: GlassContainer(
                        child: Center(
                          child: Text(
                            'HOME PAGE',
                            textAlign: TextAlign.center,
                            style: ktextStyle,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
