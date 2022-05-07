import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _picker = ImagePicker();

  void loadModel() async {
    String? res = await Tflite.loadModel(
        model: "assets/tflite/model.tflite",
        labels: "assets/tflite/labels.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false);
  }

  void runModel(String filepath) async {
    var recognitions = await Tflite.runModelOnImage(
        path: filepath,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);

    setState(() {
      detection = recognitions![0]['label'];
      String? test = recognitions[0]['Probability'].toString().substring(0, 6);
      double intval = double.parse(test);
      confidence = intval * 100;
      String valueToShow = confidence.toString().substring(0, 5);
      showValue = valueToShow;
      print("Probability: $valueToShow");
    });
  }

  String? showValue;
  String? imagePath;
  File? image;
  String? detection;
  double? confidence;

  void pickImage() async {
    final XFile? img = await _picker.pickImage(source: ImageSource.gallery);
    print(img!.path);
    setState(() {
      image = File(img.path);
      imagePath = img.path;
    });
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  Widget build(BuildContext context) {
    print(imagePath);
    double totalHeight = MediaQuery.of(context).size.height;
    double totalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF00ceee),
        centerTitle: true,
        title: Text(
          "Select Photo From Your Phone Gallery",
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
          imagePath == null
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height:MediaQuery.of(context).size.height*0.2),
                    Text(
                      "Please upload your fundus image to start the diagnosis.",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffff9000)),
                              onPressed: () {
                                pickImage();
                              },
                              child: Text('Upload Image')),
                        ))
                  ],
                ))
              : Column(
                  children: [
                    SizedBox(
                      height: totalHeight * 0.1,
                    ),
                    Center(
                      child: Container(
                        height: totalHeight * 0.3,
                        width: totalWidth * 0.8,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.file(image!),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        runModel(imagePath!);
                      },
                      child: Container(
                        height: totalHeight * 0.06,
                        width: totalWidth * 0.35,
                        decoration: BoxDecoration(
                          color: Color(0xFF00ceee),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Center(
                          child: Text(
                            "Analyze",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    detection == null
                        ? SizedBox()
                        : Text(
                            detection!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    SizedBox(
                      height: 10.0,
                    ),
                    confidence == null
                        ? SizedBox()
                        : Text(
                            "Probability : $showValue %",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                  ],
                ),
        ],
      ),
    );
  }
}
