import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget menuItem(BuildContext context, VoidCallback onTap, String text,
    String icon, AlignmentGeometry alignment) {
  return InkWell(
    onTap: onTap,
    child: Stack(
      alignment: alignment,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: text.length > 25 ? 12 : 16,
                fontFamily: "Exo",
                fontWeight: FontWeight.bold),
          ),
          margin: const EdgeInsets.only(left: 20, right: 20),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        iconInCircle('assets/svgs/user.svg'),
      ],
    ),
  );
}

Widget iconInCircle(String iconName) {
  return Container(
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey,
    ),
    child: SvgPicture.asset(
      iconName,
      fit: BoxFit.fill,
      semanticsLabel: 'Acme Logo',
      width: 50,
      height: 50,
      color: Colors.white,
    ),
  );
}
