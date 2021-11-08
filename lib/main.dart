import 'package:flutter/material.dart';
import 'package:kopgit_basic/components/menu_item.dart';
import 'package:kopgit_basic/route_generator.dart';

import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(child: Deneme()),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
      ),
    );
  }
}

class Deneme extends StatelessWidget {
  Deneme({
    Key? key,
  }) : super(key: key);

  Map<int, String> konular = Constants.konular;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: getResponsiveSize(context, size: 0.07));
      },
      shrinkWrap: true,
      itemCount: konular.length,
      itemBuilder: (context, index) {
        return Hero(
          tag: index,
          child: Material(
            color: Colors.transparent,
            child: menuItem(context, () {
              Navigator.of(context).pushNamed('/single', arguments: index);
            }, konular[index]!, 'assets/svgs/user.svg',
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
