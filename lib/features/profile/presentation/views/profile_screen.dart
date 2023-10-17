import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/features/auth/presentation/controllers/auth%20controller/auth_controller.dart';
import 'package:ym_blood_app/utils/const/app_color/app_color_const.dart';
import 'package:ym_blood_app/utils/const/app_const/app_const.dart';
import 'package:ym_blood_app/utils/const/images_const.dart/images_const.dart';
import 'package:ym_blood_app/utils/keyboard_dismiss/keyboard_dimiss_extension.dart';
import 'package:ym_blood_app/utils/mediaquery_extension/mediaquery_extension.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorConst.kprimaryColor,
        title: const Text(
          AppConst.kProfile,
          style: TextStyle(color: AppColorConst.white),
        ),
      ),
      body: GestureDetector(
        onTap: context.dismissKeyboard,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              authState.maybeWhen(
                loggedIn: (data) => Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          // width: context.widthPct(1),
                          height: context.heightPct(0.14),
                          decoration: BoxDecoration(
                              color: AppColorConst.kprimaryColor,
                              borderRadius: BorderRadius.circular(10)),

                          // child: Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         CachedNetworkImage(
                          //           imageBuilder: (context, imageProvider) =>
                          //               CircleAvatar(
                          //             backgroundColor: Colors.white,
                          //             backgroundImage:
                          //                 NetworkImage(data.user.image),
                          //             maxRadius: 30,
                          //           ),
                          //           imageUrl: data.user.image,
                          //           errorWidget: (context, url, error) =>
                          //               Image.asset(ImageConstants.kImageNurse),
                          //         ),
                          //         SizedBox(
                          //           width: context.widthPct(0.03),
                          //         ),
                          //         Column(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           crossAxisAlignment: CrossAxisAlignment.start,
                          //           children: [
                          //             Text(
                          //               data.user.name.toUpperCase(),
                          //               style: const TextStyle(
                          //                   color: AppColorConst.white),
                          //             ),
                          //             const Text(
                          //               AppConst.knurse,
                          //               style: TextStyle(
                          //                   fontSize: 12,
                          //                   color: AppColorConst.white,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             const SizedBox(
                          //               height: 4,
                          //             ),
                          //             Text(
                          //               data.user.hospital_name,
                          //               style: const TextStyle(
                          //                   fontSize: 10,
                          //                   color: AppColorConst.white,
                          //                   fontWeight: FontWeight.w200),
                          //             ),
                          //             const SizedBox(
                          //               height: 4,
                          //             ),
                          //             Text(
                          //               data.user.email,
                          //               style: const TextStyle(
                          //                   fontSize: 10,
                          //                   color: AppColorConst.white,
                          //                   fontWeight: FontWeight.w300),
                          //             ),
                          //             Text(
                          //               data.user.email,
                          //               style: const TextStyle(
                          //                   fontSize: 10,
                          //                   color: AppColorConst.white,
                          //                   fontWeight: FontWeight.w300),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //     SizedBox(
                          //       height: context.heightPct(0.01),
                          //     ),
                          //   ],
                          // ),
                        ),
                        CachedNetworkImage(
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            // radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              data.user.image,
                            ),
                            maxRadius: 35,
                          ),
                          imageUrl: data.user.image,
                          errorWidget: (context, url, error) => Image.asset(
                            ImageConstants.kImageNurse,
                            height: context.heightPct(0.09),
                          ),
                        ),
                      ],
                    ),
                    CupertinoListTile(
                      backgroundColor: Colors.white,
                      leading: const Icon(CupertinoIcons.news),
                      title: const Text(
                        "Name",
                        style: TextStyle(fontFamily: "Pop", fontSize: 13),
                      ),
                      subtitle: Text(
                        data.user.name.toUpperCase(),
                        style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: context.heightPct(0.01),
                    ),
                    CupertinoListTile(
                      backgroundColor: Colors.white,
                      leading: const Icon(CupertinoIcons.news),
                      title: const Text(
                        " Council No.",
                        style: TextStyle(fontFamily: "Pop", fontSize: 13),
                      ),
                      subtitle: Text(
                        data.user.nmc_no,
                        style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: context.heightPct(0.01),
                    ),
                    CupertinoListTile(
                      backgroundColor: Colors.white,
                      leading: const Icon(CupertinoIcons.news),
                      title: const Text(
                        "Hospital",
                        style: TextStyle(fontFamily: "Pop", fontSize: 13),
                      ),
                      subtitle: Text(
                        data.user.hospital_name,
                        style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: context.heightPct(0.01),
                    ),
                    CupertinoListTile(
                      backgroundColor: Colors.white,
                      leading: const Icon(CupertinoIcons.news),
                      title: const Text(
                        "Phone No",
                        style: TextStyle(fontFamily: "Pop", fontSize: 13),
                      ),
                      subtitle: Text(
                        data.user.phone_no,
                        style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                      ),
                    ),
                  ],
                ),
                orElse: () => const Text("No Data Available"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
