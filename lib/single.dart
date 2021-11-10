import 'package:flutter/material.dart';

import 'components/menu_item.dart';
import 'constants.dart';

class SinglePage extends StatelessWidget {
  const SinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? itemIndex = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Single Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Hero(
                      tag: itemIndex,
                      child: Material(
                        color: Colors.transparent,
                        child: menuItem(context, () {
                          Navigator.pop(context);
                        },
                            Constants.konular[itemIndex],
                            'assets/svgs/icons/' +
                                Constants.menuIcons[itemIndex],
                            itemIndex % 2 == 0
                                ? Alignment.centerLeft
                                : Alignment.centerRight),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 7,
                  child: Container(
                      child: Center(
                          child: RichText(
                        text: const TextSpan(
                            text: "Bu Bölüm Ne Anlatıyor",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      )),
                      decoration:
                          const BoxDecoration(color: Colors.transparent))),
            ],
          )),
    );
  }
}



// child: SingleChildScrollView(
//                           child: Bubble(
//                             longText: Text(Constants.onucuncuLema),
//                           ),
//                         ),