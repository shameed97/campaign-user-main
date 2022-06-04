import 'package:flutter/material.dart';
import 'package:offers_52_user/RegistrationPage/NumberRegistrationScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/shared_preference.dart';
import '../../widgets/custom_displays.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final SharedPreference _sharedPreference = SharedPreference();
  String shopNumber="";

  @override
  void initState() {
    super.initState();
    getValues();
  }

  getValues() async {
    shopNumber = await _sharedPreference.get("userMobile");
    setState(() {

    });
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
          child: Container(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 180,
                    ),
                    child: Column(
                      children: [
                        ListTile(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return popup();
                                  });
                            },
                            leading: Image.asset('assets/padlock 1.png'),
                            title: Text(
                              'Change Password',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFF5F5F5F)),
                            ),
                            trailing: Transform(
                              transform: Matrix4.translationValues(-10, 0, 0),
                              child: Image.asset('assets/edit.png'),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 25),
                          child: Divider(
                            height: 1,
                            color: Color(0XFF000000),
                            thickness: 0.2,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            _sharedPreference.saveBool("loginStatus", false);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                                    (Route<dynamic> route) => false);
                          },
                          leading: Image.asset('assets/logout 1.png'),
                          title: Text(
                            'Logout',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF5F5F5F)),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Color(0XFF959595),
                            size: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 25),
                          child: Divider(
                            height: 1,
                            color: Color(0XFF000000),
                            thickness: 0.2,
                          ),
                        ),
                      ],
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
                          padding: const EdgeInsets.only(left: 10, top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome User",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "$shopNumber",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
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
      ),
    );
  }
}

class popup extends StatefulWidget {
  const popup({Key key}) : super(key: key);

  @override
  _popupState createState() => _popupState();
}

class _popupState extends State<popup> {
  bool password = true;
  bool newPassword = true;
  bool retypePassword = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0XFFEEEEEE),
      scrollable: true,
      title: Text(
        'Change Password',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  obscureText: password,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide:
                        BorderSide(width: 1, color: Color(0XFFFEEE5E5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide:
                        BorderSide(width: 1, color: Color(0XFFFEEE5E5)),
                      ),
                      fillColor: Color(0XFFFDF9F9),
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15),
                      hintText: 'Current Password',
                      hintStyle: TextStyle(
                          color: Color(0XFF5C5C5C),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (password == false) {
                                password = true;
                              } else {
                                password = false;
                              }
                            });
                          },
                          icon: password == false
                              ? Icon(
                            Icons.visibility_rounded,
                            color: Colors.black45,
                          )
                              : Icon(
                            Icons.visibility_off_rounded,
                            color: Colors.black45,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: newPassword,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                      BorderSide(width: 1, color: Color(0XFFFEEE5E5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                      BorderSide(width: 1, color: Color(0XFFFEEE5E5)),
                    ),
                    fillColor: Color(0XFFFDF9F9),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15),
                    hintText: 'New Password',
                    hintStyle: TextStyle(
                        color: Color(0XFF5C5C5C),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (newPassword == false) {
                              newPassword = true;
                            } else {
                              newPassword = false;
                            }
                          });
                        },
                        icon: newPassword == false
                            ? Icon(
                          Icons.visibility_rounded,
                          color: Colors.black45,
                        )
                            : Icon(
                          Icons.visibility_off_rounded,
                          color: Colors.black45,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: retypePassword,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                      BorderSide(width: 1, color: Color(0XFFFEEE5E5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                      BorderSide(width: 1, color: Color(0XFFFEEE5E5)),
                    ),
                    fillColor: Color(0XFFFDF9F9),
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15),
                    hintText: 'Retype New Password',
                    hintStyle: TextStyle(
                        color: Color(0XFF5C5C5C),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (retypePassword == false) {
                              retypePassword = true;
                            } else {
                              retypePassword = false;
                            }
                          });
                        },
                        icon: retypePassword == false
                            ? Icon(
                          Icons.visibility_rounded,
                          color: Colors.black45,
                        )
                            : Icon(
                          Icons.visibility_off_rounded,
                          color: Colors.black45,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0))),
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "cancel",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF8D8D8D)),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 30, right: 28),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Save",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0XFFDC5A44)),
              )),
        ),
      ],
    );
  }
}
