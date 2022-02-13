import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangeProfileController extends GetxController {
  //TODO: Implement ChangeProfileController

  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController statusController;

  @override
  void onInit() {
    emailController = TextEditingController(text: 'Lorem Ipssum@gmail.com');
    nameController = TextEditingController(text: 'Lorem Ipssum');
    statusController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose(){
    emailController.dispose();
    nameController.dispose();
    statusController.dispose();
    super.onClose();
  }


}
