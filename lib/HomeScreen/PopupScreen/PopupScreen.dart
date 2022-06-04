import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:offers_52_user/HomeScreen/MessageScreen/MessageScreen.dart';


class PopupScreen extends StatefulWidget {
  final Map<String, dynamic> list;
  const PopupScreen({Key key,this.list}) : super(key: key);

  @override
  _PopupScreenState createState() => _PopupScreenState();
}

class _PopupScreenState extends State<PopupScreen> {
  final CarouselController _controller = CarouselController();

  int _currentIndex = 0;
  final List<String> imagesList = [
  ];


  @override
  void initState() {
    super.initState();
    imagesList.add(widget.list["image1"]);
    imagesList.add(widget.list["image2"]);
    imagesList.add(widget.list["image3"]);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFFAFAFA)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10,top: 20),
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 3.2,
                              width: MediaQuery.of(context).size.width,
                              child: Stack(children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                      enableInfiniteScroll: false,
                                      height: MediaQuery.of(context).size.height / 3.2,
                                      viewportFraction: 1,
                                      autoPlay: false,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      }),
                                  carouselController: _controller,
                                  items: imagesList
                                      .map((item) => Image.network(
                                    item,
                                    height:
                                    MediaQuery.of(context).size.height / 3.2,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ))
                                      .toList(),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                      onTap: () {
                                        _controller.previousPage();
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: Colors.black,
                                      )),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                      onTap: () {
                                        _controller.nextPage();
                                      },
                                      child: Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Colors.black,
                                      )),
                                )
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: SizedBox(
                                height: 30,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: imagesList.length,
                                    itemBuilder: (context, i) {
                                      return Container(
                                        width: 8.0,
                                        height: 8.0,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 2.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _currentIndex == i
                                              ? Color(0XFFCC1A0A)
                                              : Color(0XFFB2B2B2),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.list["sellerName"]}',
                              style: TextStyle(
                                  color: Color(0XFF353535),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              '#${widget.list["id"]}',
                              style: TextStyle(
                                  color: Color(0XFF747474),
                                  fontSize: 12,),
                            ),
                            Divider(color: Color(0XFFDDDDDD),),
                            Text(
                              '${widget.list["title"]}',
                              style: TextStyle(
                                  color: Color(0XFF545454),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${widget.list["description"]}',
                              style: TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF848484),height: 1.8),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Color(0XFF0A833A),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Text('3.8',
                                          style: TextStyle(
                                              fontSize: 8,
                                              fontWeight:
                                              FontWeight
                                                  .w500,
                                              color: Color(
                                                  0XFFFFFFFF)
                                          ),),
                                        Icon(Icons.star,color: Color(0XFFFFFFFF),size: 8,)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                Text(
                                  '17,170 rating',
                                  style: TextStyle(
                                      fontSize:
                                      7,
                                      fontWeight:
                                      FontWeight
                                          .w300,
                                      color: Color(
                                          0XFF0A833A)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${widget.list["reducedPrice"]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0XFFCC1A0A)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${widget.list["actualPrice"]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      color: Color(0XFF8A8A8A),
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0,right: 0,top: 8,bottom: 7),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        GestureDetector(
                                            onTap: () {},
                                            child: Container(

                                              child: Center(
                                                child: ImageIcon(
                                                  AssetImage(
                                                      'assets/ant-design_like-filled.png'),
                                                  size: 25,
                                                  color: Color(0XFF05A33B),
                                                ),
                                              ),
                                            )),
                                        Text(
                                          '101',
                                          style: TextStyle(
                                              color: Color(0XFF353535),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
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
                                              size: 25,
                                              color: Color(0XFFC00606),
                                            )),
                                        Text(
                                          '20',
                                          style: TextStyle(
                                              color: Color(0XFF353535),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (contexts) =>
                                                    MessageScreen(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 25,width: 25,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(60),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.green.withOpacity(0.4),
                                                    offset: Offset(0.0, 2),
                                                    spreadRadius: 1.0,
                                                    blurRadius: 2.0)
                                              ],
                                            ),
                                            child: Center(
                                              child: ImageIcon(AssetImage('assets/messageicon.png'),color: Color(0XFFC00606),size: 12,),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          children: [
                                            Container(
                                              height: 25,width: 25,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(60),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.green.withOpacity(0.4),
                                                      offset: Offset(0.0, 2),
                                                      spreadRadius: 1.0,
                                                      blurRadius: 2.0)
                                                ],
                                              ),
                                              child: Center(
                                                child: Icon(Icons.share_outlined,color: Color(0XFFC00606),size: 18,),
                                              ),
                                            ),
                                            Text(
                                              '100',
                                              style: TextStyle(
                                                  color: Color(0XFF353535),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          children: [
                                            GestureDetector(
                                              child:
                                              Material(
                                                elevation: 5,borderRadius: BorderRadius.circular(60),
                                                child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration:
                                                  BoxDecoration(
                                                    gradient:
                                                    LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                                      Color(0XFF03DCFA),
                                                      Color(0XFF07458E),
                                                    ]),
                                                    borderRadius: BorderRadius.circular(60),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.lightBlue.withOpacity(0.4),
                                                          offset: Offset(0.0, 1),
                                                          spreadRadius: 1.0,
                                                          blurRadius: 2.0)
                                                    ],
                                                  ),
                                                  child:
                                                  Center(
                                                    child: Image
                                                        .asset(
                                                      'assets/Group.png',
                                                      fit: BoxFit
                                                          .contain,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {},
                                            ),
                                            Text(
                                              '500',
                                              style: TextStyle(
                                                  color: Color(0XFF353535),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            )

                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          children: [
                                            GestureDetector(
                                              child:
                                              Material(
                                                elevation: 5,borderRadius: BorderRadius.circular(60),
                                                child: Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration:
                                                  BoxDecoration(
                                                    gradient:
                                                    LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                                                      Color(0XFF059324),
                                                      Color(0XFF056119),
                                                    ]),
                                                    borderRadius: BorderRadius.circular(60),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.green.withOpacity(0.4),
                                                          offset: Offset(0.0, 1),
                                                          spreadRadius: 1.0,
                                                          blurRadius: 2.0)
                                                    ],
                                                  ),
                                                  child:
                                                  Center(
                                                    child: Image
                                                        .asset(
                                                      'assets/fluent_call-24-filled.png',
                                                      fit: BoxFit
                                                          .contain,scale: 1.2,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {},
                                            ),
                                            Text(
                                              '300',
                                              style: TextStyle(
                                                  color: Color(0XFF353535),
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                             Text('Reviews', style: TextStyle(color: Color(0XFF434343), fontSize: 16, fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4,top: 10),
                        child: ListTile(
                          horizontalTitleGap: 10,
                          leading: Container(
                            child: Image.asset('assets/Mask Group.png'),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Victor Flexin', style: TextStyle(color: Color(0XFF414141), fontSize: 10, fontWeight: FontWeight.w700)),
                          SizedBox(height: 2,),
                          RatingBar.builder(
                            initialRating: 4,
                            itemSize: 10,
                            ignoreGestures: true,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),

                            ],
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.', style: TextStyle(color: Color(0XFF848484), fontSize: 8, fontWeight: FontWeight.w500)),
                          ),
                          trailing: Text('23 Sep 2021',style: TextStyle(color: Color(0XFF565656), fontSize: 8, fontWeight: FontWeight.w500)),
                        ),
                      ),
                      SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: ListTile(
                          horizontalTitleGap: 10,
                          leading: Container(
                            child: Image.asset('assets/Mask Group.png'),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Victor Flexin', style: TextStyle(color: Color(0XFF414141), fontSize: 10, fontWeight: FontWeight.w700)),
                          SizedBox(height: 2,),
                          RatingBar.builder(
                            initialRating: 4,
                            itemSize: 10,
                            minRating: 1,
                            direction: Axis.horizontal,
                            ignoreGestures: true,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),

                            ],
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vestibulum leo quis pellentesque scelerisque.', style: TextStyle(color: Color(0XFF848484), fontSize: 8, fontWeight: FontWeight.w500)),
                          ),
                          trailing: Text('23 Sep 2021',style: TextStyle(color: Color(0XFF565656), fontSize: 8, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,)

              ],
            ),
          )
        ),
      ),
    );

  }
}