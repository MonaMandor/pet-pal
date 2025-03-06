// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_pal/app/core/constansts/context_extensions.dart';
import '../controllers/splash_screen_controller.dart';
import '../../../theme/color_theme.dart';
import '../../../theme/text_theme.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GetBuilder<SplashScreenController>(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Lottie.asset(
                  height: context.propHeight(200),
                  width: context.propWidth(200),
                  fit: BoxFit.fill,
                  'assets/lottie/loading.json',
                  controller: _.animationController,
                  frameRate: FrameRate(100),
                  repeat: true,
                  onLoaded: (composition) {
                    _.animationController!..duration = composition.duration;
                  },
                ),
              ),
              SizedBox(
                height: context.propHeight(80),
              ),
              Text(
                'Pet Pal',
                style: kHeadTextStyle.copyWith(
                  color: primaryGrey,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
