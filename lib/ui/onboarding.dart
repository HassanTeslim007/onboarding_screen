import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onboarding_screen/controller/onboarding_controller.dart';
import 'package:onboarding_screen/ui/constants/sizeConfig.dart';

class OnboardingScreen extends StatelessWidget {
  final _controller = OnboardingController();

//vscode://vscode.github-authentication/did-authenticate?windowid=2&code=0b2bada6b16dbbbcb0e6&state=1b32dfdc-31b9-4101-8614-e016f81b9e78


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: PageView.builder(
                  controller: _controller.pageController,
                  onPageChanged: _controller.selectedPageindex,
                  itemCount: _controller.onboardingItems.length,
                  itemBuilder: (context, index) {
                    _controller.autoAnimate(index);
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            _controller.onboardingItems[index].image,
                            width: SizeConfig.fromHeight(context, 35),
                            height: SizeConfig.fromHeight(context, 35),
                          ),
                          SizedBox(
                            height: SizeConfig.fromHeight(context, 4),
                          ),
                          Text(
                            _controller.onboardingItems[index].title,
                            style: TextStyle(
                                fontSize: SizeConfig.fontSize(context, 5),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: SizeConfig.fromHeight(context, 4),
                          ),
                          Text(
                            _controller.onboardingItems[index].description,
                            style: TextStyle(
                              fontSize: SizeConfig.fontSize(context, 4),
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Positioned(
                bottom: SizeConfig.fontSize(context, 5),
                left: SizeConfig.fontSize(context, 5),
                child: Row(
                    children: List.generate(
                        _controller.onboardingItems.length,
                        (index) => Obx(() => InkWell(
                              onTap: () {
                                _controller.pageController.jumpToPage(index);
                              },
                              child: Container(
                                margin: EdgeInsets.all(
                                  SizeConfig.fontSize(context, 1),
                                ),
                                width: SizeConfig.fontSize(context, 3),
                                height: SizeConfig.fontSize(context, 3),
                                decoration: BoxDecoration(
                                  color: _controller.selectedPageindex.value ==
                                          index
                                      ? Colors.redAccent
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ))))),
            Positioned(
                bottom: SizeConfig.fontSize(context, 5),
                right: SizeConfig.fontSize(context, 5),
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: _controller.nextSlide,
                  child: Obx(() => Text(
                    _controller.isLastPage ? "Start" : "Next",
                    style: TextStyle(color: Colors.white),
                  )),
                  backgroundColor: Colors.redAccent,
                )),
          ],
        ),
      ),
    );
  }
}
