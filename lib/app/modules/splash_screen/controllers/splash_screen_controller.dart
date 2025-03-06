import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../settings/controllers/settings_controller.dart';
import '../../../theme/app_theme.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AnimationController? animationController;

  final userData = GetStorage();

  bool? isLoggedIn;

  setTheme() {
    var control = Get.put(SettingsController());
    int n = control.themes.indexOf(userData.read('theme'));
    Get.changeTheme(appThemeData.values.elementAt(n));
  }

  checkLogin() {
    isLoggedIn = userData.read('loginStatus');
  }

  @override
  void onInit() {
    super.onInit();
    userData.writeIfNull('theme', "Yellow Light");
    userData.writeIfNull('drinkWater', false);
    userData.writeIfNull('loginStatus', false);

    animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    animationController!.forward();
    animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController!.forward();
      }
    });
    checkLogin();
    Timer(
      Duration(milliseconds: 5500),
      () => Get.offNamed(isLoggedIn! ? '/home' : '/welcome'),
    );
  }

  @override
  void onReady() async {
    super.onReady();
    await setTheme();
  }

  @override
  void onClose() async {
    animationController!.dispose();
    super.onClose();
  }
}
