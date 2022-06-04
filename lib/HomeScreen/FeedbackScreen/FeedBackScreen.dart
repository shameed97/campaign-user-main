import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../services/shared_preference.dart';
import '../../widgets/custom_displays.dart';

class FeedBackScreen extends StatefulWidget {
  final String campID;

  const FeedBackScreen({Key key, this.campID}) : super(key: key);

  @override
  _FeedBackScreenState createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  List<String> reportList = [
    "Overall Service",
    "Customer Support",
    "pickup and Delivery service",
    "Repair Quality",
  ];
  String selectedReportList = "";
  TextEditingController descController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final SharedPreference _sharedPreference = SharedPreference();
  String uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
  String ratingPoint="";

  submitFeedback() async {
    CustomDisplays.showProgress(context);
    final ref = FirebaseFirestore.instance
        //under sellers collection
        .collection("feedback");
    uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
//information pass to firebase
    ref.doc(uniqueIdName).set(
      {
        "feedID": uniqueIdName,
        "campID": widget.campID,
        "starRating": ratingPoint,
        "improvedPoint": selectedReportList,
        "publishedDate": DateTime.now(),
        "suggestion": descController.text,
      },
    ).then((value) {
      CustomDisplays.closeDialog(context);
      CustomDisplays.showToast(msg: "Feedback saved successfully", context: context);
      descController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: Container(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 180, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Rate Your  Experience",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22, color: Color(0XFF313131)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Are you Satisfied with the Service?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 10, color: Color(0XFF979797)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          itemSize: 35,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color(0XFFEE1502),
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              ratingPoint=rating.toString();
                            });
                            print(rating);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          color: Color(0XFFDDDDDD),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Tell us what can be Improved?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16, color: Color(0XFF313131)),
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        // Center(
                        //   child: Column(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 1, top: 7),
                          child: MultiSelectChip(
                            reportList,
                            onSelectionChanged: (selectedList) {
                              setState(() {
                                selectedReportList = selectedList;
                              });
                            },
                          ),
                        ),
                        // Text(selectedReportList.toString())
                        //  ]),
                        // ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          color: Color(0XFFDDDDDD),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          maxLines: 8,
                          controller: descController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0XFFF6F6F6))),
                              hintText: 'Tell us on how can we improve...',
                              filled: true,
                              contentPadding: EdgeInsets.all(10),
                              hintStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFFA5A5A5)),
                              fillColor: Color(0XFFEFEFEF),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0XFFF6F6F6)),
                              ) // contentPadding: EdgeInsets.all(20),
                              ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                          ),
                          // ignore: deprecated_member_use
                          child: MaterialButton(
                            elevation: 0,
                            onPressed: () {
                              submitFeedback();
                            },
                            padding: EdgeInsets.symmetric(vertical: 10),
                            color: Color(0XFFF00F01),
                            shape: StadiumBorder(),
                            child: Center(
                                child: Text(
                              'SUBMIT',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
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
                          "FeedBack",
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

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(String) onSelectionChanged;

  MultiSelectChip(this.reportList, {@required this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        height: 45,
        padding: const EdgeInsets.only(
          left: 1,
          right: 15,
          top: 1,
        ),
        child: ChoiceChip(
          selectedColor: Color(0XFFEE1502),
          // disabledColor: Color(0XFFEE1502),
          label: Padding(
            padding: const EdgeInsets.only(top: 1, bottom: 1),
            child: Text(
              item,
            ),
          ),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;

              widget.onSelectionChanged(selectedChoice);
            });
          },
          labelStyle: TextStyle(
              color: selectedChoice == item ? Colors.white : Color(0XFF818181),
              fontSize: 10,
              fontWeight: FontWeight.w500),
          backgroundColor: Color(0XFFECECEC),
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
