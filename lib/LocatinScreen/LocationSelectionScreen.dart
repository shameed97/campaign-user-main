import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationSelectionScreen extends StatefulWidget {
   LocationSelectionScreen({ Key key}) : super(key: key);

  @override
  _LocationSelectionScreenState createState() => _LocationSelectionScreenState();
}

class _LocationSelectionScreenState extends State<LocationSelectionScreen> {
  bool tamil = false;
  bool karnataka = false;
  bool Goa = false;
  bool Haryana = false;
  bool Rajasthan = false;
  bool Bihar = false;
  int state1 = 3;
  List tamilnaduStates = [
    'Chennai',
    'Coimbatore',
    'Madurai',
    'Tiruchirappali',
    'Salem',
    'Tirunelveli',
    'Tiruppur',
    'Vellore',
    'Erode'
  ];
  List karnatakaStates = [
    'Chennai',
    'Coimbatore',
    'Madurai',
    'Tiruchirappali',
    'Salem',
    'Tirunelveli',
    'Tiruppur',
    'Vellore',
    'Erode'
  ];
  List goaStates = [
    'Chennai',
    'Coimbatore',
    'Madurai',
    'Tiruchirappali',
    'Salem',
    'Tirunelveli',
    'Tiruppur',
    'Vellore',
    'Erode'
  ];
  List rajasthanStates = [
    'Chennai',
    'Coimbatore',
    'Madurai',
    'Tiruchirappali',
    'Salem',
    'Tirunelveli',
    'Tiruppur',
    'Vellore',
    'Erode'
  ];
  List haryanaStates = [
    'Chennai',
    'Coimbatore',
    'Madurai',
    'Tiruchirappali',
    'Salem',
    'Tirunelveli',
    'Tiruppur',
    'Vellore',
    'Erode'
  ];
  List biharStates = [
    'Chennai',
    'Coimbatore',
    'Madurai',
    'Tiruchirappali',
    'Salem',
    'Tirunelveli',
    'Tiruppur',
    'Vellore',
    'Erode'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [

                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.clear_outlined,
                          color: Color(0xFF8B8B8B),
                          size: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Location",
                          style: TextStyle(
                            color: Color(0xFF3C3C3C),
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Color(0xFFECECEC),
                        borderRadius: BorderRadius.circular(25)),
                    child: TextField(
                      enabled: true,
                      decoration:  InputDecoration(
                        hintText:
                        'Search City,area or neighbourhood',contentPadding: EdgeInsets.only(top: 0),
                        hintStyle:
                        TextStyle(color: Color(0XFF6D6D6D),fontSize: 14),
                        prefixIcon:  Icon(
                          Icons.search,
                          color: Color(0xFF9F9B9B),
                        ),border: InputBorder.none,
                      ),
                    ),

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.radio_button_checked_outlined,
                        color: Color(0xFF005FA4),
                        size: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Use current Location',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF005FA4)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              'Enable Location',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.037,
                    decoration: BoxDecoration(
                        color: Color(0xFFF2F5F6),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 13, top: 6),
                      child: Text(
                        'Choose State',
                        style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 19),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 13),
                            child: Text(
                              'All in India',
                              style: TextStyle(
                                  color: Color(0xFF6A6969),fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Divider(
                            thickness: 1,
                            color: Color(0xFFEFEFEF),
                          ),
                          GestureDetector(
                            onTap: () {
                              tamil == true;
                              setState(() {
                                tamil = !tamil;
                                karnataka = false;
                                Rajasthan = false;
                                Goa = false;
                                Haryana = false;
                                Bihar = false;
                                print('selected');
                              });
                            },
                            child: Stack(children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(top: 0),
                                                child: Image.asset(
                                                  "assets/chennai1.png",
                                                  width: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, top: 10),
                                                child: Text(
                                                  "Tamil Nadu",
                                                  style: TextStyle(
                                                      color: Color(0xFF6A6969),
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),

                                        RotatedBox(
                                          quarterTurns: tamil ? 1: 0,
                                          child: Transform(
                                            transform: Matrix4.translationValues(0, 3, 0),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Divider(
                                      color: Color(0xFFEFEFEF),
                                      thickness: 1,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Visibility(
                                  visible: tamil,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      child: Text(
                                                        tamilnaduStates[index],
                                                        style: TextStyle(
                                                            color:
                                                            Color(0xFF6A6969),fontSize: 10,
                                                            fontWeight:
                                                            FontWeight.w600),
                                                      ),
                                                      alignment:
                                                      Alignment.centerLeft,
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color(0xFFEFEFEF),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            itemCount: tamilnaduStates.length,
                                          ),
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              karnataka == true;
                              setState(() {
                                karnataka = !karnataka;
                                tamil = false;
                                Rajasthan = false;
                                Goa = false;
                                Haryana = false;
                                Bihar = false;
                              });
                            },
                            child: Stack(children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(top: 0),
                                                child: Image.asset(
                                                  "assets/kar.png",
                                                  width: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, top: 5),
                                                child: Text(
                                                  "Karnataka",
                                                  style: TextStyle(
                                                      color: Color(0xFF6A6969),
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        SizedBox(
                                          child: RotatedBox(
                                            quarterTurns: karnataka ? 1: 0,
                                            child: Transform(
                                              transform: Matrix4.translationValues(0, 3, 0),

                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Divider(
                                      color: Color(0xFFEFEFEF),
                                      thickness: 1,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Visibility(
                                  visible: karnataka,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: ListView.builder(
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      child: Text(
                                                        karnatakaStates[index],
                                                        style: TextStyle(
                                                            color:
                                                            Color(0xFF6A6969),fontSize: 10,
                                                            fontWeight:
                                                            FontWeight.w600),
                                                      ),
                                                      alignment:
                                                      Alignment.centerLeft,
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color(0xFFEFEFEF),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            itemCount: karnatakaStates.length,
                                          ),
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.29,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              Goa == true;
                              setState(() {
                                Goa = !Goa;
                                tamil = false;
                                Rajasthan = false;
                                karnataka = false;
                                Haryana = false;
                                Bihar = false;
                              });
                            },
                            child: Stack(children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(top: 0),
                                                child: Image.asset(
                                                  "assets/goa.png",
                                                  width: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, top: 10),
                                                child: Text(
                                                  "Goa",
                                                  style: TextStyle(
                                                      color: Color(0xFF6A6969),
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                       Spacer(),
                                        SizedBox(
                                          child: RotatedBox(
                                            quarterTurns: Goa ? 1: 0,
                                            child: Transform(
                                              transform: Matrix4.translationValues(0, 3, 0),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Divider(
                                      color: Color(0xFFEFEFEF),
                                      thickness: 1,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Visibility(
                                  visible: Goa,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: ListView.builder(
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      child: Text(
                                                        goaStates[index],
                                                        style: TextStyle(
                                                            color:
                                                            Color(0xFF6A6969),fontSize: 10,
                                                            fontWeight:
                                                            FontWeight.w600),
                                                      ),
                                                      alignment:
                                                      Alignment.centerLeft,
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color(0xFFEFEFEF),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            itemCount: goaStates.length,
                                          ),
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              Rajasthan == true;
                              setState(() {
                                Rajasthan = !Rajasthan;
                                tamil = false;
                                Goa = false;
                                karnataka = false;
                                Haryana = false;
                                Bihar = false;
                              });
                            },
                            child: Stack(children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(top: 0),
                                                child: Image.asset(
                                                  "assets/raj.png",
                                                  width: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, top: 5),
                                                child: Text(
                                                  "Rajasthan",
                                                  style: TextStyle(
                                                      color: Color(0xFF6A6969),
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                       Spacer(),
                                        SizedBox(
                                          child: RotatedBox(
                                            quarterTurns: Rajasthan ? 1: 0,
                                            child: Transform(
                                              transform: Matrix4.translationValues(0, 3, 0),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Divider(
                                      color: Color(0xFFEFEFEF),
                                      thickness: 1,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Visibility(
                                  visible: Rajasthan,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: ListView.builder(
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      child: Text(
                                                        rajasthanStates[index],
                                                        style: TextStyle(
                                                            color:
                                                            Color(0xFF6A6969),fontSize: 10,
                                                            fontWeight:
                                                            FontWeight.w600),
                                                      ),
                                                      alignment:
                                                      Alignment.centerLeft,
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color(0xFFEFEFEF),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            itemCount: rajasthanStates.length,
                                          ),
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              Haryana == true;
                              setState(() {
                                Haryana = !Haryana;
                                tamil = false;
                                Goa = false;
                                karnataka = false;
                                Rajasthan = false;
                                Bihar = false;
                              });
                            },
                            child: Stack(children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(top: 0),
                                                child: Image.asset(
                                                  "assets/har.png",
                                                  width: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, top: 5),
                                                child: Text(
                                                  "Haryana",
                                                  style: TextStyle(
                                                      color: Color(0xFF6A6969),
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        SizedBox(
                                          child: RotatedBox(
                                            quarterTurns: Haryana ? 1: 0,
                                            child: Transform(
                                              transform: Matrix4.translationValues(0, 3, 0),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Divider(
                                      color: Color(0xFFEFEFEF),
                                      thickness: 1,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Visibility(
                                  visible: Haryana,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: ListView.builder(
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      child: Text(
                                                        haryanaStates[index],
                                                        style: TextStyle(
                                                            color:
                                                            Color(0xFF6A6969),fontSize: 10,
                                                            fontWeight:
                                                            FontWeight.w600),
                                                      ),
                                                      alignment:
                                                      Alignment.centerLeft,
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color(0xFFEFEFEF),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            itemCount: haryanaStates.length,
                                          ),
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          GestureDetector(
                            onTap: () {
                              Bihar == true;
                              setState(() {
                                Bihar = !Bihar;
                                tamil = false;
                                Goa = false;
                                karnataka = false;
                                Rajasthan = false;
                                Haryana = false;
                              });
                            },
                            child: Stack(children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(top: 0),
                                                child: Image.asset(
                                                  "assets/bih.png",
                                                  width: 30,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, top: 13),
                                                child: Text(
                                                  "Bihar",
                                                  style: TextStyle(
                                                      color: Color(0xFF6A6969),
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        SizedBox(
                                          child: RotatedBox(
                                            quarterTurns: Bihar ? 1: 0,
                                            child: Transform(
                                              transform: Matrix4.translationValues(0, 3, 0),
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Divider(
                                      color: Color(0xFFEFEFEF),
                                      thickness: 1,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Visibility(
                                  visible: Bihar,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: ListView.builder(
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      child: Text(
                                                        biharStates[index],
                                                        style: TextStyle(
                                                            color:
                                                            Color(0xFF6A6969),fontSize: 10,
                                                            fontWeight:
                                                            FontWeight.w600),
                                                      ),
                                                      alignment:
                                                      Alignment.centerLeft,
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      color: Color(0xFFEFEFEF),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            itemCount: biharStates.length,
                                          ),
                                          height:
                                          MediaQuery.of(context).size.height *
                                              0.30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class Search extends SearchDelegate{
//   @override
//   List<Widget> buildActions(BuildContext context){
//     return <Widget>[
//       IconButton(
//           icon: Icon(Icons.close),
//           onPressed: (){
//             query = "";
//           })
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context){
//     return IconButton(
//           icon: Icon(Icons.close),
//           onPressed: (){
//             Navigator.pop(context);
//           });
//   }
//   String selectedRessult;
//
//   @override
//   Widget buildResults(BuildContext context){
//     return Container(
//       child: Center(
//         child: Text(selectedRessult),
//       ),
//     );
//   }
// }
//
// final List<String> listExample;
// Search(this.listExample);
// @override
// Widget buildSuggestions(BuildContext context){
//   IconButton(
//     onPressed: (){
//       showSearch(context: context, delegate: Search(Widget.list));
//     },
//     icon: Icon(Icons.search),
//   );
// }