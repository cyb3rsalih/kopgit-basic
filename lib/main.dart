import 'package:flutter/material.dart';
import 'package:kopgit_basic/components/menu_item.dart';
import 'package:kopgit_basic/single.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Scaffold(body: MainScreen()),
        '/single': (context) => const Scaffold(body: Single()),
        // When navigating to the "/second" route, build the SecondScreen widget.
        //'/second': (context) => const SecondScreen(),
      },
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
      child: Column(
        children: [
          SizedBox(height: 40),
          Deneme(),
        ],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover)),
    );
  }
}

class Deneme extends StatelessWidget {
  Deneme({
    Key? key,
  }) : super(key: key);

  List<String> konular = Constants.konular;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: konular.length,
      itemBuilder: (context, index) {
        return Hero(
          tag: index,
          child: Material(
            color: Colors.transparent,
            child: menuItem(context, () {
              Navigator.pushNamed(context, '/single',
                  arguments: {index, 'assets/svgs/user.svg'});
            }, konular[index], 'assets/svgs/user.svg',
                index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight),
          ),
        );
      },
    );
  }

  double getResponsiveSize(BuildContext context, {double size = 0.5}) {
    return MediaQuery.of(context).size.width * size;
  }
}
