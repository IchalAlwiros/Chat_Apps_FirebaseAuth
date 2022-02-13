import 'package:avatar_glow/avatar_glow.dart';
import 'package:cobacli/app/controllers/auth_controller.dart';
import 'package:cobacli/app/routes/app_pages.dart';
import 'package:cobacli/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                CupertinoIcons.arrow_left,
                color: Colors.black,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  authC.logout();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
              //margin: EdgeInsets.all(15s),
              child: Column(
                children: [
                  AvatarGlow(
                    endRadius: 110,
                    glowColor: Colors.black,
                    duration: const Duration(seconds: 2),
                    child: Container(
                      width: 175,
                      height: 175,
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
                  Text(
                    'Lorem Ipsum',
                    style: generalStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text('loremipsum@gmail.com',
                      style: generalStyle, textAlign: TextAlign.center),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      onTap: ()=> Get.toNamed(Routes.UPDATE_STATUS),
                      leading: const Icon(Icons.note),
                      title: Text(
                        'Update Status',
                        style: generalStyle,
                      ),
                      trailing: const Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      onTap: ()=> Get.toNamed(Routes.CHANGE_PROFILE),
                      leading: const Icon(Icons.person),
                      title: Text(
                        'Change Profile',
                        style: generalStyle,
                      ),
                      trailing: const Icon(Icons.arrow_right),
                    ),
                    ListTile(
                      leading: const Icon(Icons.color_lens),
                      title: Text(
                        'Change Theme',
                        style: generalStyle,
                      ),
                      trailing: const Text('light'),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: context.mediaQueryPadding.bottom + 10),
              child: Column(
                children: [
                  Text(
                    'data',
                    style: generalStyle,
                  ),
                  Text(
                    'Versi',
                    style: generalStyle,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
