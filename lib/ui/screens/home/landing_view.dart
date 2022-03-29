import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:teamapttest/ui/screens/bottom_navigation/bottom_navigation.dart';
import 'package:teamapttest/ui/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:teamapttest/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:teamapttest/utils/screensize.dart';
import 'package:animations/animations.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //This makes the view model accessible to the views using stacked
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) {},
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.yellow,
              body: Stack(children: [
                OpenContainer(
                    transitionType: ContainerTransitionType.fade,
                    closedColor: Colors.transparent,
                    openColor: AppColors.primaryColor,
                    closedElevation: 0,
                    openElevation: 0,
                    transitionDuration: const Duration(seconds: 2),
                    openBuilder: (context, _) =>
                        const BottomNavigation(), //This is the new page
                    closedBuilder: (context, VoidCallback openContainer) =>
                        AnimationLimiter(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 2000),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset: -500,
                              child: SlideAnimation(
                                  curve: Curves.easeIn, child: widget),
                            ),
                            children: [
                              const SizedBox(
                                height: 80,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(500),
                                      topRight: Radius.circular(500)),
                                  color: AppColors.salmonColor,
                                  shape: BoxShape.rectangle,
                                ),
                                height: Responsive.height(context) / 1.8,
                                width: Responsive.width(context) / 1.8,
                              ),
                            ],
                          ),
                        ))),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Responsive.height(context) / 12,
                          ),
                          AnimationLimiter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 1000),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  horizontalOffset:
                                      -MediaQuery.of(context).size.width / 4,
                                  child: FadeInAnimation(
                                      curve: Curves.fastOutSlowIn,
                                      child: widget),
                                ),
                                children: [
                                  const Text(
                                    'Neo',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                        color: AppColors.black),
                                  ),
                                  const Text(
                                    'Decor',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                        color: AppColors.red),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Responsive.height(context) / 18,
                          ),
                          AnimationLimiter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 500),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  horizontalOffset:
                                      -MediaQuery.of(context).size.width / 8,
                                  child: FadeInAnimation(
                                      curve: Curves.easeOut, child: widget),
                                ),
                                children: [
                                  const Text(
                                    'Let\'s',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 40,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Responsive.height(context) / 18,
                          ),
                          AnimationLimiter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 500),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  horizontalOffset:
                                      -MediaQuery.of(context).size.width / 8,
                                  child: FadeInAnimation(
                                      curve: Curves.easeIn, child: widget),
                                ),
                                children: [
                                  const Text(
                                    'decor',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 40,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          AnimationLimiter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 500),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  horizontalOffset:
                                      -MediaQuery.of(context).size.width / 8,
                                  child: FadeInAnimation(
                                      curve: Curves.easeIn, child: widget),
                                ),
                                children: [
                                  const Text(
                                    'your home',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 40,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Responsive.height(context) / 11,
                          ),
                          AnimationLimiter(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 1500),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  horizontalOffset:
                                      -MediaQuery.of(context).size.width / 8,
                                  child: FadeInAnimation(
                                      curve: Curves.easeIn, child: widget),
                                ),
                                children: [
                                  const Text(
                                    'Be faithful to your own taste because',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 11,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AnimationLimiter(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 1500),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  horizontalOffset:
                                      -MediaQuery.of(context).size.width / 8,
                                  child: FadeInAnimation(
                                      curve: Curves.easeIn, child: widget),
                                ),
                                children: [
                                  const Text(
                                    'nothing you really like is ever out of style',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          AnimationLimiter(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                          duration: const Duration(
                                              milliseconds: 2500),
                                          childAnimationBuilder: (widget) =>
                                              SlideAnimation(
                                                horizontalOffset:
                                                    -MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        2,
                                                child: FadeInAnimation(
                                                    curve: Curves.easeOut,
                                                    child: widget),
                                              ),
                                          children: [
                                        OpenContainer(
                                            transitionType:
                                                ContainerTransitionType.fade,
                                            closedColor: Colors.transparent,
                                            openColor: AppColors.primaryColor,
                                            closedElevation: 0,
                                            openElevation: 0,
                                            transitionDuration:
                                                const Duration(seconds: 2),
                                            openBuilder: (context, _) =>
                                                const BottomNavigation(), //This is the new page
                                            closedBuilder: (context,
                                                    VoidCallback
                                                        openContainer) =>
                                                const Icon(
                                                  Icons.arrow_forward,
                                                  size: 40,
                                                ))
                                      ])))
                        ]))
              ]));
        });
  }
}
