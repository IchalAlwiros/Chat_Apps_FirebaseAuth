import 'package:cobacli/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

import 'package:introduction_screen/introduction_screen.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    TextStyle title = GoogleFonts.poppins();

    return Scaffold(
        body: IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Berinteraksi dengan mudah",
          body: "Sing Penting Chat Chatan losss...",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Center(
                child: Lottie.asset('assets/lottie/main-laptop-duduk.json')),
          ),
        ),
        PageViewModel(
          title: "Berinteraksi dengan mudah",
          body: "Sing Penting Chat Chatan losss...",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Center(
                child: Lottie.asset('assets/lottie/main-laptop-duduk.json')),
          ),
        ),
        PageViewModel(
          title: "Berinteraksi dengan mudah",
          body: "Sing Penting Chat Chatan losss...",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Center(
                child: Lottie.asset('assets/lottie/main-laptop-duduk.json')),
          ),
        ),
        PageViewModel(
          title: "Berinteraksi dengan mudah",
          body: "Sing Penting Chat Chatan losss...",
          image: Container(
            width: Get.width * 0.6,
            height: Get.height * 0.6,
            child: Center(
                child: Lottie.asset('assets/lottie/main-laptop-duduk.json')),
          ),
        ),
      ],
      onDone: () {
        Get.offAllNamed(Routes.LOGIN);
      },

      // onSkip: () {
      //   // You can also override onSkip callback
      // },
      showSkipButton: true,
      skip: Text(
        'Skip',
        style: GoogleFonts.poppins(),
      ),
      next: Text(
        'Next',
        style: GoogleFonts.poppins(),
      ),
      done: Text("Login",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    ));
  }
}
