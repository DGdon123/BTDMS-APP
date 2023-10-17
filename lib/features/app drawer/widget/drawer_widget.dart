import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  const DrawerItemWidget(
      {Key? key,
      required this.drawerLabel,
      required this.iconData,
      required this.onTap})
      : super(key: key);
  final String drawerLabel;
  final IconData iconData;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        horizontalTitleGap: 10,
        leading: Icon(
          iconData,
          color: const Color(0xff183153),
        ),
        title: Text(
          drawerLabel,
          style: const TextStyle(color: Colors.black, fontSize: 13),
        ),
        onTap: onTap);
  }
}
