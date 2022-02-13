import 'package:cobacli/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/update_status_controller.dart';

class UpdateStatusView extends GetView<UpdateStatusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.arrow_left),
          ),
          backgroundColor: Colors.redAccent,
          title: Text(
            'UpdateStatusView',
            style: generalStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: controller.updateStatusC,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      labelText: 'Status',
                      labelStyle: generalStyle.copyWith(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // borderSide:BorderSide(color: Colors.black) ,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      )),
                ),
                SizedBox(height: 30),
                Container(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('data'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
