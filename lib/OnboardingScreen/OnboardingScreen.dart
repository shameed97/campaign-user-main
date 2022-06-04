import 'package:flutter/material.dart';
import 'package:offers_52_user/RegistrationPage/NumberRegistrationScreen.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../HomeScreen/HomeScreen.dart';
import '../services/shared_preference.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController(viewportFraction: 1.1);
  final SharedPreference _sharedPreference = SharedPreference();

  int currentIndex = 0;

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    getValues();
  }

  getValues() async {
    bool loginStatus = await _sharedPreference.getBool("loginStatus");
    String cityName = await _sharedPreference.get("cityName");
    if (loginStatus != null && loginStatus) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>  HomeScreen(cityName: cityName.toString())),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<Widget> _pagesList = [
      Column(
        children: [
          Image.asset('assets/ima1.png'),
          SizedBox(
            height: MediaQuery.of(context).size.height <= 718 ? 20 : 50,
          ),
          Column(
            children: [
              Text(
                "Venenatis Enim",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  constraints: BoxConstraints(maxWidth: 350),
                  child: Text(
                    "Donec ac lacus sit amet risus dignissim rutrum et quis purus. Quisque a velit ut purus malesuada",
                    style: TextStyle(fontSize: 12, color: Color(0XFF7E7E7E), height: 1.3),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ],
      ),
      Column(
        children: [
          Image.asset('assets/ima2.png'),
          SizedBox(
            height: MediaQuery.of(context).size.height <= 718 ? 20 : 50,
          ),
          Column(
            children: [
              Text(
                "Aliquam Urna",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  constraints: BoxConstraints(maxWidth: 350),
                  child: Text(
                    "Donec ac lacus sit amet risus dignissim rutrum et quis purus. Quisque a velit ut purus malesuada",
                    style: TextStyle(fontSize: 12, color: Color(0XFF7E7E7E), height: 1.3),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ],
      ),
      Column(
        children: [
          Image.asset('assets/ima3.png'),
          SizedBox(
            height: MediaQuery.of(context).size.height <= 718 ? 20 : 50,
          ),
          Column(
            children: [
              Text(
                "Aenean malesuada",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  constraints: BoxConstraints(maxWidth: 350),
                  child: Text(
                    "Donec ac lacus sit amet risus dignissim rutrum et quis purus. Quisque a velit ut purus malesuada",
                    style: TextStyle(fontSize: 12, color: Color(0XFF7E7E7E), height: 1.3),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ],
      ),
      Column(
        children: [
          Image.asset('assets/ima4.png'),
          SizedBox(
            height: MediaQuery.of(context).size.height <= 718 ? 20 : 50,
          ),
          Column(
            children: [
              Text(
                "Praesent Ultrices",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  constraints: BoxConstraints(maxWidth: 350),
                  child: Text(
                    "Donec ac lacus sit amet risus dignissim rutrum et quis purus. Quisque a velit ut purus malesuada",
                    style: TextStyle(fontSize: 12, color: Color(0XFF7E7E7E), height: 1.3),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ],
      ),
    ];
    List<Widget> percentIndicator = [
      Padding(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: LinearPercentIndicator(
          backgroundColor: Color(0XFFF6DADA),
          // animation: true,
          lineHeight: 5.0,
          animationDuration: 100,
          percent: 0.35,
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: Color(0XFFCA0D0D),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: LinearPercentIndicator(
          backgroundColor: Color(0XFFF6DADA),
          // animation: true,
          lineHeight: 5.0,
          animationDuration: 100,
          percent: 0.70,
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: Color(0XFFCA0D0D),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: LinearPercentIndicator(
          backgroundColor: Color(0XFFF6DADA),
          // animation: true,
          lineHeight: 5.0,
          animationDuration: 100,
          percent: 1,
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: Color(0XFFCA0D0D),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: LinearPercentIndicator(
          backgroundColor: Color(0XFFF6DADA),
          // animation: true,
          lineHeight: 5.0,
          animationDuration: 100,
          percent: 1,
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: Color(0XFFCA0D0D),
        ),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: height / 1.4,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          10,
                          MediaQuery.of(context).size.height <= 718 ? height / 12 : height / 8,
                          10,
                          0),
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: _pagesList.length,
                        onPageChanged: onChangedFunction,
                        itemBuilder: (BuildContext context, int index) {
                          return FractionallySizedBox(
                            widthFactor: 1 / pageController.viewportFraction,
                            child: Container(
                              child: _pagesList[currentIndex],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: MediaQuery.of(context).size.height <= 718 ? 0 : 0),
                    child: Container(
                        // height: 30,
                        width: width,
                        child: percentIndicator[currentIndex]),
                  ),
                ],
              ),
              Visibility(
                visible: currentIndex != 3,
                child: Positioned.fill(
                    bottom: 40,
                    right: width / 8.2,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          int page = pageController.page.toInt();
                          pageController.animateToPage(page + 1,
                              curve: Curves.fastLinearToSlowEaseIn, duration: Duration(seconds: 1));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: Color(0XFFD10B0B)),
                          child: Center(
                              child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 25,
                            color: Colors.white,
                          )),
                        ),
                      ),
                    )),
              ),
              Visibility(
                visible: currentIndex == 3,
                child: Positioned.fill(
                  bottom: 40,
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contexts) => const RegistrationScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                              color: Color(0XFFD10B0B)),
                          child: Center(
                              child: Text(
                            "Let's Start",
                            style: (TextStyle(color: Colors.white, fontSize: 16)),
                          )),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
