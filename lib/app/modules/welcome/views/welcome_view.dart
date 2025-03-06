import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_pal/app/core/constansts/context_extensions.dart';
import 'package:pet_pal/app/core/global_widgets/proceed_button.dart';
import '../controllers/welcome_controller.dart';
import 'login_view.dart';
import '../../../theme/color_theme.dart';
import '../../../theme/text_theme.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding:
            EdgeInsets.only(top: size.height * 0.08, left: size.width * 0.06),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.propHeight(150),
            ),
            Center(
              child: Lottie.asset(
                height: context.propHeight(200),
                width: context.propWidth(200),
                fit: BoxFit.fill,
                'assets/lottie/welcom.json',
               
                frameRate: FrameRate(100),
                repeat: true,
               
              ),
            ),
            SizedBox(width: size.width * 0.03),
            SizedBox(height: size.height * 0.035),
            Text(
              'Welcome to Pet Pal! 🐾',
              style: kHeadTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: primaryDGrey,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              'Get Organized',
              style: kSub2HeadTextStyle.copyWith(
                color: primaryDGrey,
              ),
            ),
         
           
            SizedBox(height: size.height * 0.1),
            Align(
              alignment: Alignment.center,
              child: ProceedButton(
                size: Get.size,
                onPress: () {
                  Get.to(
                    () => LoginView(),
                    transition: Transition.rightToLeft,
                  );
                },
                title: 'Start',
              ),
            )
          ],
        ),
      ),
    );
  }
}
