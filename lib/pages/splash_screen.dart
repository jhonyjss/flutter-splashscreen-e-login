import 'dart:async';
import 'package:flutter/material.dart';
import "package:login/pages/login.dart";
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  __SplashScreenStateState createState() => __SplashScreenStateState();
}

class __SplashScreenStateState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.leftToRight, child: LoginPage()));
  }

  Widget _myAnimatedWidget = FirstLogoWidget();
  Timer _timer;
  bool first = false;

  __SplashScreenStateState() {
    _timer = new Timer(const Duration(seconds: 2), () {
      setState(() {
        first = !first;
        _myAnimatedWidget = (_myAnimatedWidget.toString() == "FirstLogoWidget")
            ? SecondLogoWidget()
            : FirstLogoWidget();
      });
      startTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.blue[800],
                  Colors.purple,
                  Colors.purple[600],
                  Colors.blue
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      AnimatedCrossFade(
                        crossFadeState: first
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 300),
                        firstChild: SecondLogoWidget(),
                        secondChild: FirstLogoWidget(),
                        firstCurve: Curves.easeOut,
                        secondCurve: Curves.easeIn,
                        layoutBuilder: (topChild, topChildKey, bottomChild,
                            bottomChildKey) {
                          return Stack(
                            overflow: Overflow.visible,
                            alignment: Alignment.center,
                            children: <Widget>[
                              Positioned(
                                key: bottomChildKey,
                                top: 50,
                                child: bottomChild,
                              ),
                              Positioned(
                                key: topChildKey,
                                child: topChild,
                              ),
                            ],
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class FirstLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "FLUTTER",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class SecondLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterLogo(size: 100);
  }
}
