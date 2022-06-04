import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:offers_52_user/HomeScreen/FeedbackScreen/FeedBackScreen.dart';
import 'package:offers_52_user/HomeScreen/PopupScreen/PopupScreen.dart';

class ElectronicsScreen extends StatefulWidget {
  final String categories;

  const ElectronicsScreen({Key key, this.categories}) : super(key: key);

  @override
  _ElectronicsScreenState createState() => _ElectronicsScreenState();
}

class _ElectronicsScreenState extends State<ElectronicsScreen> {
  List<dynamic> _closedList = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Container(
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 200, right: 20, left: 20, bottom: 20),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0XFFFFFFF),
                            border: Border.all(color: Color(0XFF979797), width: 0.5),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: TextFormField(
                            enabled: true,
                            style: TextStyle(fontSize: 10),
                            decoration: InputDecoration(
                              hintText: 'Find Mobile Phones and more...',
                              contentPadding: EdgeInsets.only(top: 8),
                              hintStyle: TextStyle(color: Color(0XFF979797), fontSize: 10),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 20,
                                color: Color(0xFFACACAC),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Expanded(
                      child: Container(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection("campaigns")
                              // .where("categories", isEqualTo: "Electronics")
                              .orderBy("publishedDate", descending: true)
                              .snapshots(),
                          builder: (c, snapshot) {
                            if (snapshot.hasData) {
                              _closedList.clear();
                              for (int i = 0; i < snapshot.data?.docs?.length; i++) {
                                Map<String, dynamic> data =
                                    snapshot.data?.docs[i].data() as Map<String, dynamic>;
                                if (data['categories'].toString() == widget.categories) {
                                  _closedList.add(
                                    {
                                      'image1': '${data['thumbnailUrl1']}'
                                          '0 1.png',
                                      'image2': '${data['thumbnailUrl2']}'
                                          '0 1.png',
                                      'image3': '${data['thumbnailUrl3']}',
                                      'title': '${data['title']}',
                                      'id': '${data['campID']}',
                                      'description': '${data['longDescription']}',
                                      'reducedPrice': '₹${data['reducedPrice']}',
                                      'actualPrice': '₹${data['usualPrice']}',
                                      'likes': '101',
                                      'dislikes': '20',
                                      'views': '20',
                                      'rating': '3.6',
                                      'ratingCount': '17,170',
                                      'sellerName': '${data['sellerName']}',
                                    },
                                  );
                                }
                                print("sha...............${data}");
                              }
                            }
                            return snapshot.hasData
                                ? ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: _closedList.length,
                                    shrinkWrap: true,
                                    // physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          GestureDetector(
                                              onTap: () {},
                                              child: Card(
                                                margin: EdgeInsets.only(
                                                    top: 20,
                                                    left: 20,
                                                    right: 20,
                                                    bottom:
                                                        index == _closedList.length - 1 ? 20 : 0),
                                                elevation: 5,
                                                shadowColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      gradient: LinearGradient(
                                                          begin: Alignment.topCenter,
                                                          end: Alignment.bottomCenter,
                                                          colors: [
                                                            Color(0XFFFFFFFF),
                                                            Color(0XFFECECEC),
                                                          ])),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(15),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Expanded(
                                                            flex: 1,
                                                            child: Image.network(
                                                              _closedList[index]['image1'],
                                                              height: 180,
                                                              fit: BoxFit.fill,
                                                            )),
                                                        Expanded(
                                                            flex: 2,
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets.only(left: 10),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                      constraints: BoxConstraints(
                                                                          maxWidth: 150),
                                                                      child: Text(
                                                                        _closedList[index]['title'],
                                                                        style: TextStyle(
                                                                            fontSize: 15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color:
                                                                                Color(0XFF353535)),
                                                                      )),
                                                                  SizedBox(
                                                                    height: 4,
                                                                  ),
                                                                  Text(
                                                                    "#${_closedList[index]['id']}",
                                                                    style: TextStyle(
                                                                        fontSize: 8,
                                                                        color: Color(0XFF848484),
                                                                        height: 1.7),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 4,
                                                                  ),
                                                                  Text(
                                                                    _closedList[index]
                                                                        ['description'],
                                                                    style: TextStyle(
                                                                        fontSize: 8,
                                                                        fontWeight: FontWeight.w500,
                                                                        color: Color(0XFF848484),
                                                                        height: 1.7),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (contexts) =>
                                                                              FeedBackScreen(campID:  _closedList[index]['id']),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize: MainAxisSize.max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex: 1,
                                                                          child: Container(
                                                                            width: 30,
                                                                            decoration: BoxDecoration(
                                                                              color:
                                                                                  Color(0XFF0A833A),
                                                                              borderRadius:
                                                                                  BorderRadius
                                                                                      .circular(4),
                                                                            ),
                                                                            child: Padding(
                                                                              padding:
                                                                                  const EdgeInsets
                                                                                      .all(5.0),
                                                                              child: Row(
                                                                                children: [
                                                                                  Text(
                                                                                    _closedList[index]
                                                                                        ['rating'],
                                                                                    style: TextStyle(
                                                                                        fontSize: 8,
                                                                                        fontWeight:
                                                                                            FontWeight
                                                                                                .w500,
                                                                                        color: Color(
                                                                                            0XFFFFFFFF)),
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.star,
                                                                                    color: Color(
                                                                                        0XFFFFFFFF),
                                                                                    size: 8,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width: 5,
                                                                        ),
                                                                        Expanded(
                                                                          flex: 4,
                                                                          child: Text(
                                                                            '${_closedList[index]['ratingCount']} rating',
                                                                            style: TextStyle(
                                                                                fontSize: 7,
                                                                                fontWeight:
                                                                                    FontWeight.w300,
                                                                                color: Color(
                                                                                    0XFF0A833A)),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),

                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        _closedList[index]
                                                                            ['reducedPrice'],
                                                                        style: TextStyle(
                                                                            fontSize: 18,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color:
                                                                                Color(0XFFCC1A0A)),
                                                                      ),
                                                                      SizedBox(
                                                                        width: 10,
                                                                      ),
                                                                      Text(
                                                                        _closedList[index]
                                                                            ['actualPrice'],
                                                                        style: TextStyle(
                                                                            fontSize: 15,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            color:
                                                                                Color(0XFF828282),
                                                                            decoration:
                                                                                TextDecoration
                                                                                    .lineThrough),
                                                                      ),
                                                                    ],
                                                                  ),

                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),

                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                      // color: Colors.white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.5),
                                                                      // boxShadow: [
                                                                      //   BoxShadow(
                                                                      //       color: Color(0XFFe0e0e0),
                                                                      //       spreadRadius: 2.0,
                                                                      //       blurRadius: 4.0,
                                                                      //       offset: Offset(0.0, 0.0))
                                                                      // ],
                                                                    ),
                                                                    child: Padding(
                                                                      padding:
                                                                          const EdgeInsets.only(
                                                                              right: 10,
                                                                              left: 10,
                                                                              top: 4,
                                                                              bottom: 4),
                                                                      child: Row(
                                                                        children: [
                                                                          Column(
                                                                            children: [
                                                                              GestureDetector(
                                                                                  onTap: () {},
                                                                                  child: ImageIcon(
                                                                                    AssetImage(
                                                                                        'assets/ant-design_like-filled.png'),
                                                                                    size: 23,
                                                                                    color: Color(
                                                                                        0XFF05A33B),
                                                                                  )),
                                                                              Text(
                                                                                _closedList[index]
                                                                                    ['likes'],
                                                                                style: TextStyle(
                                                                                    color: Color(
                                                                                        0XFF353535),
                                                                                    fontSize: 10,
                                                                                    fontWeight:
                                                                                        FontWeight
                                                                                            .w400),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            width: 10,
                                                                          ),
                                                                          Column(
                                                                            children: [
                                                                              GestureDetector(
                                                                                  onTap: () {},
                                                                                  child: ImageIcon(
                                                                                    AssetImage(
                                                                                        'assets/ant-design_like-filled (1).png'),
                                                                                    size: 23,
                                                                                    color: Color(
                                                                                        0XFFC00606),
                                                                                  )),
                                                                              Text(
                                                                                _closedList[index]
                                                                                    ['dislikes'],
                                                                                style: TextStyle(
                                                                                    color: Color(
                                                                                        0XFF353535),
                                                                                    fontSize: 10,
                                                                                    fontWeight:
                                                                                        FontWeight
                                                                                            .w400),
                                                                              )
                                                                            ],
                                                                          ),
                                                                          Spacer(),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (contexts) =>
                                                                                      PopupScreen
                                                                                        (list: _closedList[index]),
                                                                                ),
                                                                              );
                                                                            },
                                                                            child: Column(
                                                                              children: [
                                                                                Icon(
                                                                                  Icons
                                                                                      .remove_red_eye_outlined,
                                                                                  color: Color(
                                                                                      0XFFC00606),
                                                                                  size: 23,
                                                                                ),
                                                                                Text(
                                                                                  _closedList[index]
                                                                                      ['views'],
                                                                                  style: TextStyle(
                                                                                      color: Color(
                                                                                          0XFF353535),
                                                                                      fontSize: 10,
                                                                                      fontWeight:
                                                                                          FontWeight
                                                                                              .w400),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  // ElevatedButton(
                                                                  //   onPressed: () {
                                                                  //
                                                                  //   },
                                                                  //   style: ElevatedButton.styleFrom(
                                                                  //     primary: Color(0XFFEBEBEB),
                                                                  //     shape: RoundedRectangleBorder(
                                                                  //         borderRadius:
                                                                  //         BorderRadius.circular(17.5)),
                                                                  //   ),
                                                                  //   child: Text(
                                                                  //     "Reopen Campaign",
                                                                  //     style: TextStyle(
                                                                  //         fontSize: 11,
                                                                  //         color: Color(0XFF262626),
                                                                  //         fontWeight: FontWeight.w500),
                                                                  //   ),
                                                                  // ),
                                                                ],
                                                              ),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          // SizedBox(
                                          //   height: 10,
                                          // )
                                        ],
                                      );
                                    })
                                : const Center(
                                    child: CircularProgressIndicator(),
                                  );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    child: Image.asset(
                      "assets/Ellipse 3.png",
                      fit: BoxFit.fill,
                      width: width,
                    )),
                Positioned(
                    top: 0,
                    child: Image.asset(
                      "assets/Ellipse 2.png",
                      fit: BoxFit.fill,
                      width: width,
                    )),
                Positioned(
                    top: 0,
                    child: Image.asset(
                      "assets/Ellipse 1.png",
                      fit: BoxFit.fill,
                      width: width,
                    )),
                Positioned(
                  top: 20,
                  left: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          "assets/back1.png",
                          height: 25,
                          width: 25,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          widget.categories,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 28, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
