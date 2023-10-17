import 'package:flutter/material.dart';
import 'package:ym_blood_app/utils/const/app_color/app_color_const.dart';
import 'package:ym_blood_app/utils/mediaquery_extension/mediaquery_extension.dart';

class OfflineWarningWidget extends StatelessWidget {
  const OfflineWarningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      width: context.widthPct(1),
      height: context.heightPct(0.07),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue.withOpacity(0.7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.warning,
            color: Colors.white,
            size: context.heightPct(0.05),
          ),
          Text(
            'Currently you are on offline mode.',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontSize: 12,
                  color: AppColorConst.white,
                  fontWeight: FontWeight.bold,
                ),
          )
        ],
      ),
    );
  }
}
