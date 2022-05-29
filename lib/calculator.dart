import 'package:life_expectancy/user_data.dart';

class Calculate {
  UserData userData;
  Calculate({required this.userData});

  double calculator() {
    double result;

    result = 80 + userData.dosport - userData.smoke;
    result = result + (userData.height / userData.weight);
    if (userData.selectedGender == 'FEMALE') {
      return result + 5;
    } else {
      return result;
    }
  }
}
