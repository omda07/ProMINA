
import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path0 = Path();
    path0.moveTo(size.width * 0.9999412, size.height * -0.0039625);
    path0.lineTo(size.width * 1.0016176, size.height * 0.1847875);
    path0.quadraticBezierTo(size.width * 0.9975882, size.height * 0.1211875,
        size.width * 0.8204118, size.height * 0.1228625);
    path0.cubicTo(
        size.width * 0.6711471,
        size.height * 0.1178625,
        size.width * 0.6634412,
        size.height * 0.0790625,
        size.width * 0.6652941,
        size.height * 0.0609375);
    path0.cubicTo(
        size.width * 0.6580882,
        size.height * 0.0143000,
        size.width * 0.6218824,
        size.height * 0.0053375,
        size.width * 0.5063824,
        size.height * -0.0035375);
    path0.quadraticBezierTo(size.width * 0.5806471, size.height * -0.0032250,
        size.width * 0.9999412, size.height * -0.0039625);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    return true;
  }
}
