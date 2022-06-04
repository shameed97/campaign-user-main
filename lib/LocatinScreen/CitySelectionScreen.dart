import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offers_52_user/LocatinScreen/AreaSelectionScreen.dart';


class CitySelectionScreeen extends StatefulWidget {
  const CitySelectionScreeen({Key key}) : super(key: key);

  @override
  _CitySelectionScreeenState createState() => _CitySelectionScreeenState();
}

class _CitySelectionScreeenState extends State<CitySelectionScreeen> {
  List<dynamic> _cities = [
    {
      'title': 'Mumbai',
      'image': 'assets/delhi.png',
    },
    {
      'title': 'Delhi',
      'image': 'assets/delhi.png',
    },
    {
      'title': 'Chennai',
      'image': 'assets/chennai.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          height: height,
          width: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 160, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cities",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFF3C3C3C)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                        itemCount: _cities.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 15),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: ()  {

                              if (index == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (contexts) =>
                                        AreaSelectionScreen(),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                color: Color(0XFFF4F4F4),
                                border: Border.all(
                                    color: Color(0XFFDEDEDE), width: 1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    _cities[index]["image"],
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _cities[index]['title'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: index == 2
                                            ? Color(0XFFD10B0B)
                                            : Color(0XFF585858)),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              Positioned.fill(
                top: 25,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/offerslogo.png',
                    width: width / 2,
                  ),
                ),
              ),
              Positioned(
                  top: 0, left: 0, child: Image.asset('assets/Ellipse 4.png',fit: BoxFit.fill,),width: width,),
              Positioned(
                  top: 0, left: 0, child: Image.asset('assets/Ellipse 5.png',fit: BoxFit.fill,),width: width,),
            ],
          ),
        ),
      ),
    );
  }
}
