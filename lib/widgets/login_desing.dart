import 'package:flutter/material.dart';
import 'package:helpapp/constatns/colors.dart';

class LoginDesing extends StatelessWidget {
  const LoginDesing({super.key});

  @override
  Widget build(BuildContext context) {
    final screenhHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainColor,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: TopShape(),
                child: Container(
                  height: screenhHeight / 3,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          Color(0xff467DB2),
                          Color(0xff004D7D),
                        ]),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: ClipPath(
                clipper: BottomShape(),
                child: Container(
                  height: screenhHeight / 3,
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                        colors: [
                          Color(0xff004D7D),
                          Color(0xff467DB2),
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.quadraticBezierTo(size.width * 0.8100000, size.height * -0.0014286,
        size.width * 0.9825000, 0);
    path0.cubicTo(
        size.width * 0.9325000,
        size.height * 0.3364286,
        size.width * 0.4595833,
        size.height * 0.2135714,
        size.width * 0.1675000,
        size.height * 0.5014286);
    path0.cubicTo(
        size.width * 0.0312500,
        size.height * 0.6607143,
        size.width * 0.0475000,
        size.height * 0.9285714,
        0,
        size.height * 0.9285714);
    path0.quadraticBezierTo(0, size.height * 0.9300000, 0, 0);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BottomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width, size.height);
    path0.lineTo(size.width * 0.0425000, size.height);
    path0.quadraticBezierTo(size.width * 0.0447917, size.height * 0.9578571,
        size.width * 0.0966667, size.height * 0.9271429);
    path0.cubicTo(
        size.width * 0.1606250,
        size.height * 0.9028571,
        size.width * 0.2106250,
        size.height * 0.8878571,
        size.width * 0.6458333,
        size.height * 0.7242857);
    path0.cubicTo(
        size.width * 0.8231250,
        size.height * 0.6514286,
        size.width * 0.9387500,
        size.height * 0.4703571,
        size.width * 0.9741667,
        size.height * 0.1857143);
    path0.quadraticBezierTo(size.width * 0.9850000, size.height * 0.1464286,
        size.width, size.height * 0.1357143);
    path0.lineTo(size.width, size.height);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
