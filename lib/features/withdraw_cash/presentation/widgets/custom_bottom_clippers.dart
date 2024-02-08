import 'dart:ui';

import 'package:flutter/material.dart';

class FirstBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..moveTo(0, size.height) // Перенос точки в левый нижний угол
      ..lineTo(0, size.height * 0.87) // Левая вертикальная линия
      ..cubicTo(width * 0.20, height * 0.85, width * 0.40, height * 0.97, width,
          height * 0.92)
      ..lineTo(size.width, size.height); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SecondBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..moveTo(0, size.height) // Перенос точки в левый нижний угол
      ..lineTo(0, size.height * 0.90) // Левая вертикальная линия
      ..cubicTo(width * 0.40, height * 0.80, width * 0.80, height * 0.96, width,
          height * 0.94)
      ..lineTo(size.width, size.height); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class ThirdBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..moveTo(0, size.height) // Перенос точки в левый нижний угол
      ..lineTo(0, size.height * 0.89) // Левая вертикальная линия
      ..cubicTo(width * 0.40, height * 0.99, width * 0.70, height * 0.84, width,
          height * 0.87)
      ..lineTo(size.width, size.height); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class FourthBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;
    Path path = Path()
      ..moveTo(0, size.height) // Перенос точки в левый нижний угол
      ..lineTo(0, size.height * 0.82) // Левая вертикальная линия
      ..cubicTo(width * 0.25, height * 0.99, width * 0.50, height * 0.84, width,
          height * 0.93)
      ..lineTo(size.width, size.height); // Правая вертикальная линия
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class AllBottomClippers extends StatelessWidget {
  const AllBottomClippers({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: ThirdBottomClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(108, 24, 164, 0.4),
              Color.fromRGBO(108, 24, 164, 0.4),
            ])),
          ),
        ),
        ClipPath(
          clipper: FirstBottomClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(108, 24, 164, 0.7),
              Color.fromRGBO(108, 24, 164, 0.7),
            ])),
          ),
        ),
        ClipPath(
          clipper: FourthBottomClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(56, 39, 180, 0.2),
              Color.fromRGBO(108, 24, 164, 0.2),
            ])),
          ),
        ),
        ClipPath(
          clipper: SecondBottomClipper(),
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
