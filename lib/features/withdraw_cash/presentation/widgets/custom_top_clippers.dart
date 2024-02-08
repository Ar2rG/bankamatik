import 'dart:ui';

import 'package:flutter/material.dart';

class FirstTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..lineTo(0, height * 0.21) // Левая вертикальная линия
      ..cubicTo(
          // x1, y1
          width * 0.45,
          height * 0.16,
          // x2, y2
          width * 0.69,
          height * 0.30,
          // x3, y3
          width,
          height * 0.25)
      ..lineTo(width, 0); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SecondTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..lineTo(0, height * 0.20) // Левая вертикальная линия
      ..cubicTo(
          // x1, y1
          width * 0.30,
          height * 0.19,
          // x2, y2
          width * 0.7,
          height * 0.38,
          // x3, y3
          width,
          height * 0.23)
      ..lineTo(width, 0); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ThirdTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..lineTo(0, height * 0.28) // Левая вертикальная линия
      ..cubicTo(
          // x1, y1
          width * 0.40,
          height * 0.30,
          // x2, y2
          width * 0.55,
          height * 0.12,
          // x3, y3
          width,
          height * 0.24)
      ..lineTo(width, 0); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class FourthTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..lineTo(0, height * 0.21) // Левая вертикальная линия
      ..cubicTo(
          // x1, y1
          width * 0.50,
          height * 0.37,
          // x2, y2
          width * 0.78,
          height * 0.12,
          // x3, y3
          width,
          height * 0.33)
      ..lineTo(width, 0); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class AllTopClippers extends StatelessWidget {
  const AllTopClippers({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: FourthTopClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(108, 24, 164, 0.2),
              Color.fromRGBO(56, 39, 180, 0.2),
            ])),
          ),
        ),
        ClipPath(
          clipper: ThirdTopClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(108, 24, 164, 0.4),
              Color.fromRGBO(56, 39, 180, 0.7),
            ])),
          ),
        ),
        ClipPath(
          clipper: SecondTopClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(56, 39, 180, 0.7),
              Color.fromRGBO(108, 24, 164, 0.7),
            ])),
          ),
        ),
        ClipPath(
          clipper: FirstTopClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(56, 39, 180, 0.7),
              Color.fromRGBO(108, 24, 164, 0.7),
            ])),
          ),
        ),
      ],
    );
  }
}
