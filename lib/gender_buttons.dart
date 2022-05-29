import 'package:flutter/material.dart';

class GenderButtons extends StatelessWidget {
  final String gender;
  final IconData icon;
  GenderButtons({required this.gender, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
