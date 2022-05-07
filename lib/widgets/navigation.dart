import 'package:circular_bottom_navigation/tab_item.dart';

import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:retimo/screens/about/about.dart';
import 'package:retimo/screens/homepage/homepage.dart';

class NavigationHelper extends StatefulWidget {
  NavigationHelper({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _NavigationHelperState createState() => _NavigationHelperState();
}

class _NavigationHelperState extends State<NavigationHelper> {
  int selectedPos = 0;
  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }
  List<TabItem> tabItems = List.of([
    new TabItem(Icons.photo_library, "Upload Image", Color(0xff00a5bd)),
    // new TabItem(Icons.camera, "Scan Eye", Colors.green),
    //new TabItem(Icons.photo_library, "Select Photo", Color(0xffff9000)),
    new TabItem(Icons.info, "App Guide", Colors.black),
  ]);

  CircularBottomNavigationController? _navigationController;
  double bottomNavBarHeight = 60.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  bodyContainer() {
    switch (selectedPos) {
      case 0:
        return HomePage();
        break;
      case 1:
        return AboutPage();
        break;
      // case 2:
      //   return HomePage();
      //   break;
      // case 3:
      //   return HomePage();
      //   break;
    }
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int? selectedPos) {
        setState(() {
          this.selectedPos = selectedPos!;
          print(_navigationController!.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController!.dispose();
  }
}
