import 'package:flutter/material.dart';
import 'package:retimo/screens/onboarding/onboaring_screen.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  void pushToHome(BuildContext context) async {
    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoarding(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    pushToHome(context);
    return Scaffold(
      body: Container(
        height: totalHeight * 1,
        width: totalWidth * 1,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('assets/images/splashScreen.jpg'),
        ),
      ),
    );
  }
}
