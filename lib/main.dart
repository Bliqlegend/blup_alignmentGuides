import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

// main method that runs the runApp Method.
void main() {
  runApp(TapCoords());
}

class TapCoords extends StatelessWidget {
  const TapCoords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blup Task',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Move the text'),
        ),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyWidgetState();
  }
}

class MyWidgetState extends State<MyWidget> {
  double text1Left = 100.0;
  double text1top = 100.0;
  double text2Left = 100.0;
  double text2top = 150.0;

  double flen = 2.4 * 30;
  double slen = 3.3 * 30;

  List<Widget> positionedGuidelines = <Widget>[];

  @override
  Widget build(BuildContext context) {
    // GestureDetector that will detect the ontap
    return Stack(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: text1top,
              left: text1Left,
              child: GestureDetector(
                onPanEnd: (details) => positionedGuidelines.clear(),
                onPanUpdate: (details) {
                  text1Left = max(0, text1Left + details.delta.dx);
                  text1top = max(0, text1top + details.delta.dy);

                  //left alignment
                  if ((text1Left - text2Left).abs() <= 1.5) {
                    positionedGuidelines.clear();
                    double heightVariable = (text2top - text1top).abs();
                    int heightVarInt = heightVariable.toInt();
                    positionedGuidelines.add(
                      Positioned(
                        left: text1Left,
                        top: text1top,
                        child: Row(
                          children: [
                            Container(
                              height: (text2top - text1top).abs() + 1.1 * 30,
                              width: 1.5,
                              color: Colors.pink,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                shape: BoxShape.rectangle,
                              ),
                              child: Center(
                                child: Text(
                                  "$heightVarInt",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    positionedGuidelines.clear();
                  }
                  //right alignment
                  if (((text1Left + flen) - (text2Left + slen)).abs() <= 1) {
                    positionedGuidelines.clear();
                    double heightVariable = (text2top - text1top).abs();
                    int heightVarInt = heightVariable.toInt();
                    positionedGuidelines.add(
                      Positioned(
                        left: text1Left + 'Hello'.length + 2.1 * 30,
                        top: text1top,
                        child: Row(
                          children: [
                            Container(
                              height: (text2top - text1top).abs() + 1.1 * 30,
                              width: 1.5,
                              color: Colors.pink,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                shape: BoxShape.rectangle,
                              ),
                              child: Center(
                                child: Text(
                                  "$heightVarInt",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  //center alignemnt
                  if (((text1Left + flen / 2) - (text2Left + slen / 2)).abs() <=
                      1) {
                    positionedGuidelines.clear();
                    double heightVariable = (text2top - text1top).abs();
                    int heightVarInt = heightVariable.toInt();
                    positionedGuidelines.add(
                      Positioned(
                        left: text1Left + ('Hello'.length + 2.15 * 30) / 2,
                        top: text1top,
                        child: Row(
                          children: [
                            Container(
                              height: (text2top - text1top).abs() + 1.1 * 30,
                              width: 1.5,
                              color: Colors.blue,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.rectangle,
                              ),
                              child: Center(
                                child: Text(
                                  "$heightVarInt",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  setState(() {
                    positionedGuidelines;
                  });
                },
                child: Container(
                  width: 2.4 * 30,
                  height: 'Hello'.length + 1.1 * 30,
                  child: const Text(
                    'Hello',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: text2top,
              left: text2Left,
              child: GestureDetector(
                onPanEnd: (details) => {positionedGuidelines.clear()},
                onPanUpdate: (details) {
                  text2Left = max(0, text2Left + details.delta.dx);
                  text2top = max(0, text2top + details.delta.dy);
                  double heightVariable = (text2top - text1top).abs();
                  int heightVarInt = heightVariable.toInt();
                  //left alignment
                  if ((text1Left - text2Left).abs() <= 1.5) {
                    positionedGuidelines.clear();
                    positionedGuidelines.add(
                      Positioned(
                        left: text1Left,
                        top: text1top,
                        child: Row(
                          children: [
                            Container(
                              height: (text1top - text2top).abs() + 1.1 * 30,
                              width: 1.5,
                              color: Colors.pink,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                shape: BoxShape.rectangle,
                              ),
                              child: Center(
                                child: Text(
                                  "$heightVarInt",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    positionedGuidelines.clear();
                  }
                  //right alignment
                  if (((text1Left + flen) - (text2Left + slen)).abs() <= 1) {
                    positionedGuidelines.clear();
                    double heightVariable = (text2top - text1top).abs();
                    int heightVarInt = heightVariable.toInt();
                    positionedGuidelines.add(
                      Positioned(
                        left: text1Left + 'Mellow'.length + 2.05 * 30,
                        top: text1top,
                        child: Row(
                          children: [
                            Container(
                              height: (text2top - text1top).abs() + 1.1 * 30,
                              width: 1.5,
                              color: Colors.pink,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.pink,
                                shape: BoxShape.rectangle,
                              ),
                              child: Center(
                                child: Text(
                                  "$heightVarInt",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  //centerAlignment
                  if (((text1Left + flen / 2) - (text2Left + slen / 2)).abs() <=
                      1) {
                    positionedGuidelines.clear();
                    double heightVariable = (text2top - text1top).abs();
                    int heightVarInt = heightVariable.toInt();
                    positionedGuidelines.add(
                      Positioned(
                        left: text1Left + ('Mellow'.length + 2.15 * 30) / 2,
                        top: text1top,
                        child: Row(
                          children: [
                            Container(
                              height: (text2top - text1top).abs() + 1.1 * 30,
                              width: 1.5,
                              color: Colors.blue,
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.rectangle,
                              ),
                              child: Center(
                                child: Text(
                                  "$heightVarInt",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  setState(() {
                    positionedGuidelines;
                  });
                },
                child: Container(
                  width: 3.3 * 30,
                  height: 'Mellow'.length + 1.1 * 30,
                  child: (const Text(
                    'Mellow',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )),
                ),
              ),
            ),
            ...positionedGuidelines
          ],
        ),
      ],
    );
  }
}
