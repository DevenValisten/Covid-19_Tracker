import 'package:covid_tracker/constant.dart';
import 'package:covid_tracker/theme/my_theme.dart';
import 'package:covid_tracker/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);
    List<Color> lightGradientColor = [
      Color(0xff3383CD),
      Color(0xff11249F),
    ];
    List<Color> darkGradientColor = [
      Color(0xff253499),
      Color(0xff1B1F3A),
    ];
    return ClipPath(
      clipper: _MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 0, top: 100),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors:
                  provider.getTheme == MyTheme().lightTheme ? lightGradientColor : darkGradientColor
              //3383CD
              //11249F

              //266199
              //0C196B
              ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    child: Image.asset(
                      kDoctorSitImage,
                      width: 180,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 180,
                    child: Text(
                      'Bersama-sama \nkita lawan virus \ncorona',
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyClipper extends CustomClipper<Path> {
  int radiusHeight = 50;
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - radiusHeight);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - radiusHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
