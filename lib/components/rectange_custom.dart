import 'package:flutter/material.dart';

rectangleWithBorderRadius(double width, double height, double borderRadius) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: Colors.white,
    ),
  );
}
