import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_pal/app/core/constansts/context_extensions.dart';
import 'package:pet_pal/app/core/global_widgets/input_text_feild.dart';
import 'package:pet_pal/app/core/global_widgets/proceed_button.dart';

import '../controllers/welcome_controller.dart';

class LoginView extends GetView<WelcomeController> {
  final WelcomeController controller = Get.put(WelcomeController());
  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.only(
              top: size.height * 0.12,
              left: size.width * 0.15,
              right: size.width * 0.15),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                   Lottie.asset(
                  height: context.propHeight(200),
                  width: context.propWidth(200),
                  fit: BoxFit.fill,
                  'assets/lottie/logIn.json',
                 
                  frameRate: FrameRate(100),
                  repeat: true,
                 
                
                ),
                SizedBox(height: size.height * 0.08),
                InputTextFormField(
                  validator: controller.fNameValidator,
                  hintText: 'First name',
                  tController: controller.firstNameController,
                ),
                SizedBox(height: size.height * 0.03),
                InputTextFormField(
                  validator: controller.lNameValidator,
                  hintText: 'Last name (Optional)',
                  tController: controller.lastNameController,
                ),
                SizedBox(height: size.height * 0.03),
                InputTextFormField(
                  validator: controller.emailValidator,
                  hintText: 'Email',
                  tController: controller.emailController,
                ),
                SizedBox(height: size.height * 0.03),
                GetBuilder<WelcomeController>(
                  id: 5,
                  builder: (_) => ToggleButtons(
                    children: [
                      Image(image: AssetImage('assets/images/male-user-1.png')),
                      Image(image: AssetImage('assets/images/female-user-1.png')),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffeeeeee),
                    renderBorder: false,
                    fillColor: Color(0xffffc045).withOpacity(0.68),
                    splashColor: Color(0xffffc045),
                    constraints: BoxConstraints.expand(
                        height: size.width * 0.14, width: size.width * 0.14),
                    isSelected: controller.selectedToggleGender,
                    onPressed: controller.onToggledGender,
                  ),
                ),
                SizedBox(height: size.height * 0.07),
                ProceedButton(
                  size: size,
                  onPress: () {
                    if (controller.formKey.currentState!.validate()) {
                    controller.userLogin();
                    }
                    else{
                     ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please fill the form correctly'),
                      ),
                    );
                    }
                  },
                  title: 'Register',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
