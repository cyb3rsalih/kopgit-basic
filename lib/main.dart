import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Deneme(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover)),
    );
  }
}

class Deneme extends StatelessWidget {
  const Deneme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton.icon(
          icon: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(border: Border.all(color: Colors.yellow)),
            child: SvgPicture.asset(
              "assets/svgs/user.svg",
              fit: BoxFit.fill,
              semanticsLabel: 'Acme Logo',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 7),
              backgroundColor: Colors.black,
              primary: Colors.white),
          label: Text(
            "Meleklere İman",
            style: TextStyle(fontFamily: "Exo", fontWeight: FontWeight.bold),
          ),
          onPressed: () {},
        )
      ],
    ));
  }
}
