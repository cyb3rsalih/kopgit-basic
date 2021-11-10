import 'package:flutter/material.dart';

import 'components/menu_item.dart';
import 'constants.dart';

class Anasayfa extends StatelessWidget {
  const Anasayfa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
            height: Constants.getResponsiveSize(context, size: 0.04));
      },
      shrinkWrap: true,
      itemCount: Constants.konular.length,
      itemBuilder: (context, index) {
        return Hero(
          tag: index,
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: menuItem(context, () {
                Navigator.of(context).pushNamed('/single', arguments: index);
              },
                  Constants.konular[index],
                  'assets/svgs/icons/' + Constants.menuIcons[index],
                  index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight),
            ),
          ),
        );
      },
    );
  }
}
