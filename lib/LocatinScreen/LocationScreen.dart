import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:offers_52_user/LocatinScreen/CitySelectionScreen.dart';

class locationScreen extends StatefulWidget {
  const locationScreen({Key key}) : super(key: key);

  @override
  _locationScreenState createState() => _locationScreenState();
}

class _locationScreenState extends State<locationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/gmap.png',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width / 12.5,
                  15,
                  MediaQuery.of(context).size.width / 12.5,
                  10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 220),
                    child: Text(
                      'Maecenas auctor Nam non tortor tellus.',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF3C3C3C)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Text(
                      'orem ipsum dolor sit amet, consectetur adipiscing elit. Nulla lobortis convallis turpis, in vulputate libero facilisis sed.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0XFF6A6868),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 17,
                    width: MediaQuery.of(context).size.width / 1.6,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0XFFD10B0B)),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.red.withOpacity(0.5))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/gps.png',
                            height: 24,
                            width: 24,
                          ),
                          Text('Around me',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 17,
                    width: MediaQuery.of(context).size.width / 1.6,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(10),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.red.withOpacity(0.5))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contexts) => CitySelectionScreeen(),
                          ),
                        );
                      },
                      child: Text('Set location manually',
                          style: TextStyle(
                              color: Color(0xff4B4949),
                              fontSize: 16)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
