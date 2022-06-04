import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:offers_52_user/RegistrationPage/VerificationScreen.dart';

import '../widgets/custom_displays.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: height / 3),
                        child: SizedBox(
                          height: height / 10,
                        ),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Color(0XFFEDE1E1)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(color: Color(0XFFEDE1E1)),
                              ),
                              fillColor: Color(0XFFF2EDED),
                              filled: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                              prefixIcon: ImageIcon(
                                AssetImage('assets/smartphone.png'),
                              ),
                              hintText: 'Mobile Number',
                              hintStyle: TextStyle(color: Color(0XFF7C7979), fontSize: 14),
                              border:
                                  OutlineInputBorder(borderRadius: BorderRadius.circular(40.0))),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 17,
                        width: MediaQuery.of(context).size.width / 2.1,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(10),
                              shape: MaterialStateProperty.all(StadiumBorder()),
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0XFFD10B0B)),
                              shadowColor:
                                  MaterialStateProperty.all<Color>(Colors.red.withOpacity(0.5))),
                          onPressed: () {
                            navigateToOtpScreen();
                          },
                          child: Text('Get OTP',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  top: 180,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset('assets/offerslogo.png'),
                  ),
                ),
                Positioned(top: 0, left: 0, child: Image.asset('assets/backroundvector.png')),
                Positioned(top: 0, left: 0, child: Image.asset('assets/transparent.png')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToOtpScreen() {
    if (phoneController.text.isEmpty) {
      CustomDisplays.showToast(msg: "Please enter mobile number", context: context);
    } else if (phoneController.text.length != 10) {
      CustomDisplays.showToast(msg: "Phone number must be 10 characters long", context: context);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (contexts) => VerificationScreen(
            mobileNumber: phoneController.text,
          ),
        ),
      );
    }
  }
}
