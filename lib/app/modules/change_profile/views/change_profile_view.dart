import 'package:avatar_glow/avatar_glow.dart';
import 'package:cobacli/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_profile_controller.dart';

class ChangeProfileView extends GetView<ChangeProfileController> {
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
            'Change Profile',
            style: generalStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.save),
            )
          ],
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                AvatarGlow(
                  endRadius: 75,
                  glowColor: Colors.grey,
                  duration: const Duration(seconds: 2),
                  child: Container(
                    width: 120,
                    height: 120,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                        image: AssetImage('assets/logo/noimage.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller.emailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: generalStyle.copyWith(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // borderSide:BorderSide(color: Colors.black) ,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      )),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller.nameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      labelText: 'Nama',
                      labelStyle: generalStyle.copyWith(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // borderSide:BorderSide(color: Colors.black) ,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      )),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: controller.statusController,
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
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      )),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'No image',
                        style: generalStyle.copyWith(fontSize: 13),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Pilih File',
                            style: generalStyle.copyWith(
                                fontWeight: FontWeight.w600),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: generalStyle.copyWith(fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
