import 'package:flutter/material.dart';
import 'package:kopgit_basic/constants.dart';
import 'package:kopgit_basic/route_generator.dart';

import 'anasayfa.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
          padding: const EdgeInsets.only(top: 40),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 50, right: 50),
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(Constants.bordo),
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "KOPGIT BASIC",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: 'KGSecond'),
                          )),
                    )),
                Expanded(
                    flex: 9, child: SingleChildScrollView(child: Anasayfa())),
              ],
            ),
          ),
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
      ),
    );
  }
}
