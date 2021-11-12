import 'package:flutter/material.dart';

import '../constants.dart';

AppBar appBarBuild(BuildContext context) {
  return AppBar(
    backgroundColor: Color(Constants.bordo),
    centerTitle: true,
    title: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(Constants.bordo),
        ),
        child: const Text(
          "KOPGİT BASIC",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Exo',
              fontWeight: FontWeight.bold),
        )),
    leading: Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: IconButton(
        iconSize: 30,
        icon: Icon(Icons.account_circle_outlined),
        onPressed: () {},
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 25.0),
        child: IconButton(
          iconSize: 30,
          icon: Icon(Icons.help_outline_outlined),
          onPressed: () {},
        ),
      ),
    ],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
  );
}
