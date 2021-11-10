import 'package:flutter/material.dart';

class Constants {
  static int bordo = 0xFF68110B;
  static List<String> konular = [
    "Besmeledeki Sır (1.Söz)",
    "Allah'a İman (23.Lem'a)",
    "Nübüvvet Delilleri (19.Mektup)",
    "Ahirete İman (10.Söz)",
    "Kadere İman (26.Söz)",
    "Meleklere İman (29.Söz)",
    "Namaza Dair (4,9,21.Söz)",
    "Şeytan & Kötülük Problemi (13.Lem'a)",
    "Vesvese (21.Söz 2.Makam)"
  ];

  static List<String> menuIcons = [
    "bismillah.svg",
    "iman.svg",
    "nubuvvet.svg",
    "ahiret.svg",
    "kader.svg",
    "melekler.svg",
    "namaz.svg",
    "seytan.svg",
    "vesvese.svg"
  ];

  static String onucuncuLema = "Bir takım dini bilgiler";

  static double getResponsiveSize(BuildContext context, {double size = 0.5}) {
    return MediaQuery.of(context).size.width * size;
  }
}
