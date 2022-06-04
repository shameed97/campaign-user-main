import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:offers_52_user/HomeScreen/HomeScreen.dart';

import '../services/shared_preference.dart';

class AreaSelectionScreen extends StatefulWidget {
  AreaSelectionScreen({Key key}) : super(key: key);

  @override
  _AreaSelectionScreenState createState() => _AreaSelectionScreenState();
}

class _AreaSelectionScreenState extends State<AreaSelectionScreen> {
  List chennai = [
    'Adambakkam',
    'Adyar, Chennai',
    'Alandur',
    'Anna Nagar',
    'Ashok Nagar, Chennai',
    'Ayanavaram',
    'Chennai',
    'Chetpet (Chennai)',
    'Choolai',
    'Chromepet',
    'Egmore',
    'Gopalapuram, Chennai',
    'Guindy',
    'Injambakkam',
    'Kanathur (Chennai)',
    'Kodambakkam',
    'Kodungaiyur',
  ];

  var cityName = "";
  final SharedPreference _sharedPreference = SharedPreference();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 10, bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              icon: Image.asset(
                                "assets/back.png",
                                height: 25,
                                width: 25,
                                color: Color(0XFF8B8B8B),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Spacer(),
                            Text(
                              "Chennai",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                  color: Color(0XFF3C3C3C)),
                            ),
                            Spacer(
                              flex: 2,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0XFFFFFFF),
                            border: Border.all(color: Color(0XFFDFDFDF), width: 1),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: TextFormField(
                            enabled: true,
                            style: TextStyle(fontSize: 14),
                            decoration: InputDecoration(
                              hintText: 'Search area',
                              contentPadding: EdgeInsets.only(top: 5),
                              hintStyle: TextStyle(color: Color(0XFF6D6D6D), fontSize: 14),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 20,
                                color: Color(0xFF9F9B9B),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "All",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0XFF5E5E5E)),
                            ),
                            Divider(
                              thickness: 0.1,
                              color: Color(0xFF000000),
                            )
                          ],
                        ),
                      ),
                      ListView.builder(
                        padding: EdgeInsets.only(top: 0, left: 10, right: 10),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  cityName = chennai[index];
                                });
                                _sharedPreference.saveBool("loginStatus", true);
                                _sharedPreference.save("cityName", cityName);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (contexts) => HomeScreen(cityName: cityName),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                                    child: Container(
                                      width: width,
                                      child: Text(
                                        chennai[index],
                                        style: TextStyle(
                                            color: Color(0XFF5E5E5E),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 0.1,
                                    color: Color(0xFF000000),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: chennai.length,
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
