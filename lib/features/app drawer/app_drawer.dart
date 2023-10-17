import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ym_blood_app/features/auth/presentation/controllers/auth%20controller/auth_controller.dart';
import 'package:ym_blood_app/features/auth/presentation/views/change_password_screen.dart';
import 'package:ym_blood_app/features/nurselog/presentation/widgets/nurse_log_screen.dart';
import 'package:ym_blood_app/utils/const/app_color/app_color_const.dart';
import 'package:ym_blood_app/utils/const/app_const/app_const.dart';
import 'package:ym_blood_app/utils/const/images_const.dart/images_const.dart';
import 'package:ym_blood_app/utils/custom_navigation/app_nav.dart';
import 'package:ym_blood_app/utils/mediaquery_extension/mediaquery_extension.dart';

import '../history/history_screen.dart';
import '../profile/presentation/views/profile_screen.dart';
import 'widget/drawer_widget.dart';

class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: [
          authState.maybeWhen(
            loggedIn: (data) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              // width: context.widthPct(1),
              height: context.heightPct(0.14),
              decoration: BoxDecoration(
                  color: AppColorConst.kprimaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(data.user.image),
                          maxRadius: 30,
                        ),
                        imageUrl: data.user.image,
                        errorWidget: (context, url, error) => Image.asset(
                          ImageConstants.kImageNurse,
                          height: 40,
                        ),
                      ),
                      SizedBox(
                        width: context.widthPct(0.03),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.user.name.toUpperCase(),
                            style: const TextStyle(color: AppColorConst.white),
                          ),
                          const Text(
                            AppConst.knurse,
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColorConst.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            data.user.hospital_name,
                            style: const TextStyle(
                                fontSize: 10,
                                color: AppColorConst.white,
                                fontWeight: FontWeight.w200),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            data.user.email,
                            style: const TextStyle(
                                fontSize: 10,
                                color: AppColorConst.white,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.heightPct(0.01),
                  ),
                ],
              ),
            ),
            orElse: () => const Text("No Data Available"),
          ),
          DrawerItemWidget(
              drawerLabel: AppConst.kdrawerHome,
              iconData: FontAwesomeIcons.houseUser,
              onTap: () => Navigator.pop(context)),
          DrawerItemWidget(
              drawerLabel: AppConst.kdrawerProfile,
              iconData: FontAwesomeIcons.user,
              onTap: () => normalNav(context, const ProfileScreen())),
          DrawerItemWidget(
              drawerLabel: AppConst.kdrawerLogs,
              iconData: FontAwesomeIcons.folder,
              onTap: () => normalNav(context, const NurseLogScreen())),
          DrawerItemWidget(
              drawerLabel: AppConst.kdrawerHistory,
              iconData: FontAwesomeIcons.arrowsRotate,
              onTap: () => normalNav(context, const HistoryScreen())),
          DrawerItemWidget(
              drawerLabel: AppConst.kdrawerPassword,
              iconData: FontAwesomeIcons.key,
              onTap: () => normalNav(context, const ChangePasswordScreen())),
          DrawerItemWidget(
              drawerLabel: AppConst.kdrawerLogout,
              iconData: FontAwesomeIcons.rightFromBracket,
              onTap: () async {
                Navigator.pop(context);
                await showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text(
                        "Are you sure you want to Logout?",
                        style: TextStyle(
                            fontFamily: "Pop",
                            // fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      actions: [
                        IconButton(
                          onPressed: () async {
                            await ref
                                .watch(authControllerProvider.notifier)
                                .logout(context);

                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: const Duration(milliseconds: 800),
                                  content: const Text('Log Out Successfully'),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height -
                                              100,
                                      right: 20,
                                      left: 20),
                                ),
                              );
                            }
                          },
                          icon: Text("LogOut".toUpperCase()),
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Text("Cancel".toUpperCase()),
                        ),
                      ],
                    );
                  },
                );
              }),
          SizedBox.fromSize(size: Size.fromHeight(context.heightPct(0.24))),
          const Text(
            AppConst.kappDetail,
            style: TextStyle(fontSize: 11, color: CupertinoColors.systemGrey),
          )
        ],
      ),
    );
  }
}
