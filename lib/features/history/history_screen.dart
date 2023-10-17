import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/features/offline/invalid_controller.dart';
import 'package:ym_blood_app/features/offline/offline_controller.dart';
import 'package:ym_blood_app/utils/const/app_const/app_const.dart';
import 'package:ym_blood_app/utils/custom_navigation/app_nav.dart';

import '../../utils/const/app_color/app_color_const.dart';
import '../../utils/network notifier/controller/network_notifier_controller.dart';
import '../offline_dashboard/views/edit_invalid_screen.dart';
import '../offline_dashboard/views/edit_offline_screen.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  bool loadStatus = true;

  @override
  void initState() {
    _controller = TabController(
      vsync: this,
      length: 2,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    handleInitialDataLoad();
  }

  Future<void> handleInitialDataLoad() async {
    final networkAware = ref.watch(networkAwareControllerProvider);
    // final offlineList = ref.watch(offlineControllerProvider);
    // final invalidList = ref.watch(invalidControllerProvider);

    if (networkAware == NetworkStatus.on) {
      if (loadStatus) {
        print("network on");
        await ref.read(offlineControllerProvider.notifier).loadFromDb();
        await ref.read(invalidControllerProvider.notifier).loadFromDb();
        await ref.read(offlineControllerProvider.notifier).syncData().then(
            (_) => ref.read(invalidControllerProvider.notifier).loadFromDb());
        ref.invalidate(invalidControllerProvider);
        ref.invalidate(offlineControllerProvider);
        setState(() {
          loadStatus = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final networkAware = ref.watch(networkAwareControllerProvider);
    // final offilneList = ref.watch(offlineControllerProvider);
    // final invalidList = ref.watch(invalidControllerProvider);

    // if (networkAware == NetworkStatus.on) {
    //   if (loadStatus) {
    //     print("netowrk on");
    //     ref.read(offlineControllerProvider.notifier).loadFromDb();
    //     ref.read(invalidControllerProvider.notifier).loadFromDb();
    //     ref.read(offlineControllerProvider.notifier).syncData().then((value) =>
    //         ref.read(invalidControllerProvider.notifier).loadFromDb());
    //     ref.refresh(invalidControllerProvider);
    //     ref.refresh(offlineControllerProvider);
    //     setState(() {
    //       loadStatus = false;
    //     });
    //   }
    // }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  ref.invalidate(invalidControllerProvider);
                  ref.invalidate(offlineControllerProvider);
                },
                icon: const Icon(Icons.sync))
          ],
          backgroundColor: AppColorConst.kprimaryColor,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const Text(AppConst.kHistory),
          bottom: TabBar(
            indicatorColor: Colors.blueAccent,
            controller: _controller,
            tabs: const [
              Text(
                "All History",
                style: TextStyle(color: AppColorConst.white),
              ),
              Text(
                "Invalid",
                style: TextStyle(color: AppColorConst.white),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            ref.watch(offlineControllerProvider).isEmpty
                ? const Center(
                    child: Text(
                    "No history available",
                  ))
                : ListView(
                    children: [
                      ...ref.watch(offlineControllerProvider).map((e) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration:
                              const BoxDecoration(color: AppColorConst.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CupertinoListTile(
                                trailing: IconButton(
                                    onPressed: () {
                                      normalNav(
                                          context,
                                          OfflineScreenComment(
                                            e: e,
                                          ));
                                    },
                                    icon: const Icon(CupertinoIcons.pencil)),
                                backgroundColor: Colors.white,
                                // leading: const Icon(CupertinoIcons.news),
                                title: const Text(
                                  "Blood Bag Component NO.",
                                  style: TextStyle(
                                      fontFamily: "Pop",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  e.componentSn,
                                  style: const TextStyle(
                                    fontFamily: "Pop",
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              CupertinoListTile(
                                trailing: IconButton(
                                    onPressed: () async {
                                      await ref
                                          .read(offlineControllerProvider
                                              .notifier)
                                          .removeData(e);
                                    },
                                    icon: const Icon(CupertinoIcons.delete)),
                                backgroundColor: Colors.white,
                                // leading: const Icon(CupertinoIcons.news),
                                title: const Text(
                                  "Bag Status :",
                                  style: TextStyle(
                                      fontFamily: "Pop",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  e.bagUseStatus,
                                  style: const TextStyle(
                                    fontFamily: "Pop",
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              CupertinoListTile(
                                backgroundColor: Colors.white,
                                // leading: const Icon(CupertinoIcons.news),
                                title: const Text(
                                  "Reaction :",
                                  style: TextStyle(
                                      fontFamily: "Pop",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  e.reaction,
                                  style: const TextStyle(
                                    fontFamily: "Pop",
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              CupertinoListTile(
                                backgroundColor: Colors.white,
                                // leading: const Icon(CupertinoIcons.news),
                                title: const Text(
                                  "Reaction Details:",
                                  style: TextStyle(
                                      fontFamily: "Pop",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  e.reactionDetails,
                                  style: const TextStyle(
                                    fontFamily: "Pop",
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              // Text(e["component_sn"]),
                            ],
                          ),
                        );
                      })
                    ],
                  ),
            ref.watch(invalidControllerProvider).isEmpty
                ? const Center(child: Text("No Invalid data available"))
                : ListView(
                    children: [
                      ...ref.watch(invalidControllerProvider).map((e) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration:
                              const BoxDecoration(color: AppColorConst.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CupertinoListTile(
                                trailing: IconButton(
                                    onPressed: () {
                                      normalNav(
                                          context,
                                          EditInvalidScreen(
                                            e: e,
                                          ));
                                    },
                                    icon: const Icon(CupertinoIcons.pencil)),
                                backgroundColor: Colors.white,
                                // leading: const Icon(CupertinoIcons.news),
                                title: const Text(
                                  "Blood Bag Component NO.",
                                  style: TextStyle(
                                      fontFamily: "Pop",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  e.componentSn,
                                  style: const TextStyle(
                                    fontFamily: "Pop",
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              CupertinoListTile(
                                trailing: IconButton(
                                    onPressed: () async {
                                      await ref
                                          .read(invalidControllerProvider
                                              .notifier)
                                          .removeData(e);
                                    },
                                    icon: const Icon(CupertinoIcons.delete)),
                                backgroundColor: Colors.white,
                                // leading: const Icon(CupertinoIcons.news),
                                title: const Text(
                                  "Bag Status :",
                                  style: TextStyle(
                                      fontFamily: "Pop",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  e.bagUseStatus,
                                  style: const TextStyle(
                                    fontFamily: "Pop",
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              CupertinoListTile(
                                backgroundColor: Colors.white,
                                // leading: const Icon(CupertinoIcons.news),
                                title: const Text(
                                  "Reaction :",
                                  style: TextStyle(
                                      fontFamily: "Pop",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  e.reaction,
                                  style: const TextStyle(
                                    fontFamily: "Pop",
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              CupertinoListTile(
                                backgroundColor: Colors.white,
                                // leading: const Icon(CupertinoIcons.news),
                                title: const Text(
                                  "Reaction Details:",
                                  style: TextStyle(
                                      fontFamily: "Pop",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  e.reactionDetails,
                                  style: const TextStyle(
                                    fontFamily: "Pop",
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              // Text(e["component_sn"]),
                            ],
                          ),
                        );
                      })
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
