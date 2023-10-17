import 'package:flutter/cupertino.dart';
import 'package:ym_blood_app/utils/const/app_color/app_color_const.dart';
import 'package:ym_blood_app/utils/mediaquery_extension/mediaquery_extension.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {super.key, required this.label, required this.onPressed});
  final String label;
  
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: context.widthPct(0.9)),
      child: CupertinoButton(
          color: const Color(AppColorConst.primaryDark),
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(fontFamily: "Pop", fontSize: 13),
          )),
    );
  }
}
