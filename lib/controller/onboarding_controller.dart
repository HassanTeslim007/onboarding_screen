import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:onboarding_screen/model/onboarding_model.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class OnboardingController extends GetxController{
  var selectedPageindex = 0.obs;
  var pageController = PageController();
  var pageViewAutoAnimateTimer;
  bool get isLastPage => selectedPageindex.value == onboardingItems.length - 1;
  //int index;

  List<OnboardingModel> onboardingItems = [
    OnboardingModel("assets/company_logo.png", "Welcome to Our Company",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies mauris vitae dignissim placerat. Suspendisse semper et metus nec lobortis"),
    OnboardingModel("assets/dummy.png", "Some Unnecessary Title ",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies mauris vitae dignissim placerat. Suspendisse semper et metus nec lobortis"),
    OnboardingModel("assets/dumy.png", "Another Unnecessay Title",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies mauris vitae dignissim placerat. Suspendisse semper et metus nec lobortis"),
  ];

  nextSlide() {
    pageController.nextPage(duration: 300.milliseconds, curve: Curves.easeIn);
  }

  autoAnimate(index) {
    pageViewAutoAnimateTimer = Timer.periodic(5.seconds, (timer) {
      if (pageController.page != 2.0) {
        pageController.nextPage(
            duration: 400.milliseconds, curve: Curves.linear);
      }
    });
    // _pageViewAutoAnimateTimer.cancel();
  }
}
