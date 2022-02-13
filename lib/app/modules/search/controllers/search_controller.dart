import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  
  late TextEditingController searchC;

  @override
  void onInit(){
    searchC = TextEditingController();
    super.onInit(); 
  }
  @override
  void ocClose(){
    searchC.dispose();
    super.onClose();
  }
}
