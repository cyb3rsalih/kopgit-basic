import 'package:flutter/material.dart';

import '../constants.dart';

AppBar appBarBuild() {
  return AppBar(
    backgroundColor: Color(Constants.bordo),
    centerTitle: true,
    title: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(Constants.bordo),
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: const Text(
          "KOPGIT BASIC",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontFamily: 'KGSecond'),
        )),
  );
}
