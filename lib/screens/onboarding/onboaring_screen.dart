import 'package:flutter/material.dart';
import 'package:retimo/widgets/navigation.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: totalHeight * 1,
            width: totalWidth * 1,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/images/home_background.jpg'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NavigationHelper(),
            ),
          );
        },
        icon: Icon(Icons.arrow_right),
        backgroundColor: Color(0xFF00ceee),
        label: Text("Get Started"),
      ),
    );
  }
}
