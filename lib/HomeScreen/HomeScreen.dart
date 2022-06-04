import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ElectronicsScreen/ElectronicsScreen.dart';
import 'OffersScreen/OffersScreen.dart';
import 'ProfileScreen/ProfileScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, @required this.cityName}) : super(key: key);
  final String cityName;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Color> colors = <Color>[
    Color(0XFFD9FEBC),
    Color(0XFFFEE4BC),
    Color(0XFFBCFEF6),
    Color(0XFFBCDEFE),
    Color(0XFFE5D9FF),
    Color(0XFFFFDCDA),
    Color(0XFFBCFAFE),
    Color(0XFFDBDADA),
    Color(0XFFFEBCF0),
    Color(0XFFF0D6C9),
    Color(0XFFA4D38E),
    Color(0XFFBCC3FE),
    Color(0XFFFEF7BC),
    Color(0XFFFF4A58),
    Color(0XFFBCFEE6),
    Color(0XFFFEBCC4),
    Color(0XFFCADCF8),
    Color(0XFFFEF0BC),
  ];

  List<dynamic> _menus = [
    {
      'title': 'Groceries',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 2.png',
    },
    {
      'title': 'Restaurant & cafes',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1.png',
    },
    {
      'title': 'Clothing',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (1).png',
    },
    {
      'title': 'Electronics',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (2).png',
    },
    {
      'title': 'Real estate',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (3).png',
    },
    {
      'title': 'Furniture',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (4).png',
    },
    {
      'title': 'Automobile',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (5).png',
    },
    {
      'title': 'Health',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (6).png',
    },
    {
      'title': 'Beauty',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (7).png',
    },
    {
      'title': 'Travel',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (8).png',
    },
    {
      'title': 'Pets',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (9).png',
    },
    {
      'title': 'Books & Stationaries',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (11).png',
    },
    {
      'title': 'Jewellery',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (12).png',
    },
    {
      'title': 'Kids',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (13).png',
    },
    {
      'title': 'Home appliances',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (14).png',
    },
    {
      'title': 'Sports',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (16).png',
    },
    {
      'title': 'Consultants',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (17).png',
    },
    {
      'title': 'Footwear',
      'image': 'assets/495-4958054_groceries-png-clipart-groceries-png 1 (19).png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: height,
            width: width,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, right: 10, left: 20, bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.cityName,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0XFF595959)),
                              ),
                              Spacer(),
                              IconButton(
                                icon: Image.asset(
                                  "assets/user.png",
                                  color: Color(0XFFD10B0B),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (contexts) => ProfileScreen(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0XFFFFFFF),
                                    border: Border.all(
                                        color: Color(0XFFDFDFDF), width: 1),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: TextField(
                                    textInputAction: TextInputAction.search,
                                    onSubmitted: (value) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (contexts) => OffersScreen(),
                                        ),
                                      );
                                    },
                                    enabled: true,
                                    style: TextStyle(fontSize: 10),
                                    decoration: InputDecoration(
                                      hintText: 'Find Mobile Phones and more...',
                                      contentPadding: EdgeInsets.only(top: 8),
                                      hintStyle: TextStyle(
                                          color: Color(0XFF6D6D6D), fontSize: 10),
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
                              Container(
                                height: 180,
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(27),
                                ),
                                child: Image.asset(
                                  'assets/maxresdefault 1.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Categories",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFF434343)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.only(top: 20),
                    height: height/2.1,
                    child: GridView.builder(
                        itemCount: _menus.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.85,
                            mainAxisSpacing: 0),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (contexts) =>
                                        ElectronicsScreen(categories: _menus[index]["title"].toString()),
                                  ),
                                );
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: colors[index],
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //       color: Colors.black
                                      //           .withOpacity(0.1),
                                      //       offset: Offset(0.0, 3),
                                      //       spreadRadius: 1.0,
                                      //       blurRadius: 2.0)
                                      // ],
                                      // gradient: LinearGradient(
                                      //     begin: Alignment.topCenter,
                                      //     end: Alignment.bottomCenter,
                                      //     colors: [
                                      //       Color(0XFFFFFFFF),
                                      //       Color(0XFFF1F1F1),
                                      //     ]),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        _menus[index]["image"],
                                        fit: BoxFit.contain,width: 60,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(height: 5,),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(top: 3),
                                    child: Container(
                                      // height: 50,
                                        constraints: BoxConstraints(
                                            maxWidth: 95),
                                        child: Text(
                                          _menus[index]["title"],
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0XFF292929),
                                          ),
                                          textAlign: TextAlign.center,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),

                ],
              ),
            )),
      ),
    );
  }
}
