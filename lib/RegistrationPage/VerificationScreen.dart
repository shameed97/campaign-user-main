import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:offers_52_user/LocatinScreen/LocationScreen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../services/shared_preference.dart';
import '../widgets/custom_displays.dart';

class VerificationScreen extends StatefulWidget {
  final String mobileNumber;

  const VerificationScreen({Key key, @required this.mobileNumber}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final SharedPreference _sharedPreference = SharedPreference();
  final OtpFieldController _pinEditingController = OtpFieldController();
  bool hasError = false;
  bool isCodeSent = false;
  String _verificationId;
  String otpPin = "";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      _onVerifyCode();
    });
  }

  void _onVerifyCode() async {
    setState(() {
      isCodeSent = true;
    });

    final PhoneVerificationFailed verificationFailed = (authException) {
      print("SMSCODE......." + authException.message);
      CustomDisplays.showToast(msg: "${authException.message}", context: context);
      setState(() {
        isCodeSent = false;
      });
    };

    PhoneCodeSent codeSent = (String verificationId, [int forceResendingToken]) async {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };

    // TODO: Change country code

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+91${widget.mobileNumber}",
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          if (credential.smsCode != null) {
            print("SMSCODE......." + credential.smsCode);

            List<String> pinList = credential.smsCode.split("").toList();
            _pinEditingController.set(pinList);
            navigateToDashboard();
          } else {
            navigateToDashboard();
          }
          // ANDROID ONLY!

          // Sign the user in (or link) with the auto-generated credential
          //signInWithPhoneAuthCredential(credential);
        },
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  void _onFormSubmitted(String pinCode) async {
    CustomDisplays.showProgress(context);
    AuthCredential _authCredential =
        PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: pinCode);

    _firebaseAuth.signInWithCredential(_authCredential).then((UserCredential value) {
      if (value.user != null) {
        // Handle loogged in state
        print(value.user.phoneNumber);
        CustomDisplays.closeDialog(context);
        navigateToDashboard();
      } else {
        CustomDisplays.closeDialog(context);
        CustomDisplays.showToast(
            msg: "Error while validating OTP, try again later", context: context);
      }
    }).catchError((error) {
      CustomDisplays.closeDialog(context);
      // showToast("Something went wrong", Colors.red);
    });
  }

  void navigateToDashboard() async {
    Future.delayed(const Duration(seconds: 1), () {
      _sharedPreference.saveBool("loggedIn", true);
      _sharedPreference.save("userMobile", widget.mobileNumber);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const locationScreen()),
          (Route<dynamic> route) => false);
    });
  }

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
                      // Image.asset('assets/offerslogo.png'),
                      Padding(
                        padding: EdgeInsets.only(top: height / 3),
                        child: SizedBox(
                          height: height / 10,
                        ),
                      ),
                      Text(
                        'Verification Code',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'You will get a OTP via SMS',
                        style: TextStyle(fontSize: 16, color: Color(0XFFA5A4A4)),
                      ),
                      SizedBox(
                        height: height / 25,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: OTPTextField(
                          length: 6,
                          width: MediaQuery.of(context).size.width,
                          controller: _pinEditingController,
                          fieldWidth: 40,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xff6D6D6D)),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          onCompleted: (pin) {
                            setState(() {
                              otpPin = pin;
                            });
                            print("Completed: " + pin);
                            // if(pin == "1234"){
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (contexts) => locationScreen(
                            //       ),
                            //     ),
                            //   );
                            //
                            // }
                          },
                        ),
                      ),
                      SizedBox(
                        height: height / 13,
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
                            _onFormSubmitted(otpPin);
                          },
                          child: Text('Next',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Didn't Receive Anything?",
                            style: TextStyle(color: Color(0XFF7E7C7C), fontSize: 12)),
                        TextSpan(text: " "),
                        TextSpan(
                            text: 'Resend code',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFFD10B0B),
                                fontWeight: FontWeight.bold))
                      ])),
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
}
