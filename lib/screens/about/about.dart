import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "About",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        leading: SizedBox(),
      ),
      body: Stack(
        children: [
          Container(
            height: totalHeight * 1,
            width: totalWidth * 1,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/images/mainbg.jpg'),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: totalHeight * 0.02,
                ),
                Padding(
                  child: new Container(
                    child: new Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.phone_iphone,
                                  color: Color(0xff00a5bd), size: 30),
                              title: new Text(
                                'Summary',
                                style: new TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 18,
                                    color: Color(0xff00a5bd),
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                '\nWith deep learning and image processing, a convolutional neural network trained with diverse photos of DR can quickly detect the stage of Diabetic Retinopathy patients.',
                                style: TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.center,
                  ),
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  child: new Container(
                    child: new Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.remove_red_eye,
                                  color: Color(0xff00a5bd), size: 30),
                              title: new Text(
                                'What is DR?',
                                style: new TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 16,
                                    color: Color(0xff00a5bd),
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                '\nDiabetic Retinopathy (DR), an eye disease caused by diabetes, is a leading cause of blindness in working-age adults if left untreated. It harms the retinal tissue\'s blood vessels resulting in leakage and distortion of vision.',
                                style: TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.center,
                  ),
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  child: new Container(
                    child: new Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(Icons.question_mark_outlined,
                                  color: Color(0xff00a5bd), size: 30),
                              title: new Text(
                                'About',
                                style: new TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 16,
                                    color: Color(0xff00a5bd),
                                    fontWeight: FontWeight.w700),
                              ),
                              subtitle: Text(
                                '\nStudent: Mo Atoum\nProject Supervisor: Dr. Matt Dennis\nProject Moderator: Elisavet Andrikopoulou',
                                style: TextStyle(
                                    fontFamily: "SF UI Display",
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    padding: const EdgeInsets.all(0.0),
                    alignment: Alignment.center,
                  ),
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
