import 'package:flutter/material.dart';
import 'package:kopgit_basic/components/main_app_bar.dart';
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
      appBar: appBarBuild(context),
      body: const Center(
        child: SingleChildScrollView(
          child: Anasayfa(),
        ),
      ),
    );
  }
}
