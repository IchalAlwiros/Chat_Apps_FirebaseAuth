import 'package:cobacli/app/routes/app_pages.dart';
import 'package:cobacli/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  final List<Widget> searhFriends = List.generate(
    20,
    (index) => ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black26,
        child: Image.asset(
          "assets/logo/noimage.png",
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        'Nama${index + 1}',
        style: generalStyle,
      ),
      subtitle: Text('orang ${index + 1}@gmail.com'),
      trailing: GestureDetector(
        onTap: () => Get.toNamed(Routes.CHAT_ROOM),
        child: Chip(
            label: Text(
          'Chaten',
          style: generalStyle,
        )),
      ),
    ),
  ).reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            'Search',
            style:
                generalStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.arrow_left),
            onPressed: () => Get.back(),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Align(
              
              alignment: Alignment.bottomCenter,
              child: TextField(
                controller: controller.searchC,
                cursorColor: Colors.redAccent,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search new Friends',
                  hintStyle: generalStyle,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  suffixIcon: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(20),
                    child: const Icon(
                      CupertinoIcons.search,
                      color: Colors.redAccent,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: searhFriends.length == 0
          ? GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Center(
                child: Container(
                  width: Get.width * 0.7,
                  height: Get.width * 0.7,
                  child: Lottie.asset('assets/lottie/empty.json'),
                ),
              ),
            )
          : GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: searhFriends.length,
                  itemBuilder: (context, index) => searhFriends[index]),
            ),
    );
  }
}
