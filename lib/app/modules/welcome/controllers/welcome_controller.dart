import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_pal/app/data/model/user_model.dart';
import '../../home/views/home_view.dart';

class WelcomeController extends GetxController {
  late List<bool> selectedToggleGender;

  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;

  final userData = GetStorage();

  bool? isLoggedIn;

  late User user;

  // form key
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    selectedToggleGender = [false, false];
    userData.writeIfNull('fName', 'Name');
    userData.writeIfNull('lName', 'SurName');
    userData.writeIfNull('email', 'name@example.com');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    firstNameController?.dispose();
    lastNameController?.dispose();
    emailController?.dispose();
  }

  onToggledGender(int index) {
    if (index == 0) {
      selectedToggleGender[index] = !selectedToggleGender[index];
      if (selectedToggleGender[index] == true) {
        selectedToggleGender[1] = false;
      }
    }
    if (index == 1) {
      selectedToggleGender[index] = !selectedToggleGender[index];
      if (selectedToggleGender[index] == true) {
        selectedToggleGender[0] = false;
      }
    }
    update([5, true]);
  }

  String? fNameValidator(String value) {
    if (value.isEmpty) {
      return 'Enter your first name';
    }
    if (value.isAlphabetOnly) {
      return null;
    } else
      return 'Enter a valid name';
  }

  /// [ LastName validator ]
  String? lNameValidator(String value) {
    if (value.isEmpty) {
      return null;
    }
    if (value.isAlphabetOnly) {
      return null;
    } else
      return 'Enter a valid name';
  }

  String? emailValidator(String value) {
    if (value.isEmpty) {
      return 'Enter your email';
    }
    if (value.isEmail) {
      return null;
    } else
      return 'Enter a valid email';
  }

  bool validateCreds() {
    bool validated = false;
    if (fNameValidator(firstNameController!.text) == null &&
        lNameValidator(lastNameController!.text) == null &&
        emailValidator(emailController!.text) == null &&
        selectedToggleGender.contains(true)) {
      validated = true;
    } else {
      validated = false;
    }
    return validated;
  }

  userLogin() {
    if (validateCreds()) {
      user = User();
      user.firstName = firstNameController!.text;
      user.lastName = lastNameController!.text;
      user.email = emailController!.text;
      user.isMale = selectedToggleGender.first;
      userData.write('fName', user.firstName);
      userData.write('lName', user.lastName);
      userData.write('email', user.email);
      userData.write('isMale', user.isMale);
      userData.write('loginStatus', true);
      Get.offAll(() => HomeView());
    }
  }
}
