import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetworkStatus { notDetermined, on, off }

class NetworkDetectorNotifierNotifier extends StateNotifier<NetworkStatus> {
  late NetworkStatus lastResult;
  StreamController<ConnectivityResult> controller =
      StreamController<ConnectivityResult>();
  NetworkDetectorNotifierNotifier() : super(NetworkStatus.notDetermined) {
    lastResult = NetworkStatus.notDetermined;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      NetworkStatus newState;
      switch (result) {
        case ConnectivityResult.mobile:
        case ConnectivityResult.wifi:
        case ConnectivityResult.bluetooth:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.vpn:
          newState = NetworkStatus.on;
          break;
        case ConnectivityResult.none:
          newState = NetworkStatus.off;
          break;
        default:
          newState = NetworkStatus.notDetermined;
          break;
      }
      if (mounted) {
        if (newState != state) {
          state = newState;
        }
      }
    });
  }
}

final networkAwareControllerProvider = StateNotifierProvider.autoDispose<
    NetworkDetectorNotifierNotifier, NetworkStatus>((ref) {
  return NetworkDetectorNotifierNotifier();
});
