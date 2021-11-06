import 'package:flutter/material.dart';

import 'components/menu_item.dart';

class Single extends StatelessWidget {
  const Single({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bilgi;

    return SafeArea(
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.red),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.white, size: 30),
                            Text("Süha Özkan",
                                style: TextStyle(
                                    fontFamily: "Exo",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: LinearProgressIndicator(
                              value: 0.4,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: Hero(
                      tag: 8,
                      child: Material(
                        child: menuItem(context, () {
                          Navigator.pushNamed(
                            context,
                            '/',
                          );
                        }, "Allah'a İman", 'assets/svgs/user.svg',
                            Alignment.centerLeft),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 7,
                  child: Container(
                      decoration: const BoxDecoration(color: Colors.green))),
            ],
          )),
    );
  }
}
