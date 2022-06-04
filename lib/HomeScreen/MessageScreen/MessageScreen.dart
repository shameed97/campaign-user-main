import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {

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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 260),
                        decoration: BoxDecoration(
                            color: Color(0XFFFFFFFF),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.1),
                                  offset: Offset(0.0, 2),
                                  spreadRadius: 2.0,
                                  blurRadius: 2.0)
                            ],
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Hello there! Need help?',
                            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Color(0XFF272727)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      width: width,
                      color: Color(0XFFFFFFFF),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type a message',
                          hintStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Color(0XFF595959)),
                          // contentPadding: EdgeInsets.all(20),
                          prefixIcon: ImageIcon(
                            AssetImage('assets/paperclip.png'),color: Color(0XFFF00F01),
                          ),
                          suffixIcon: ImageIcon(
                            AssetImage('assets/send.png'),color: Color(0XFFF00F01),
                          ),
                        ),
                      ),
                    )

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
                          "Chat",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 28,
                              color: Colors.white),
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
