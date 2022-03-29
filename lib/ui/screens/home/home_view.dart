import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:teamapttest/ui/screens/home/details_view.dart';
import 'package:teamapttest/ui/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:teamapttest/ui/widget/items_widget.dart';
import 'package:teamapttest/utils/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:teamapttest/utils/screensize.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Home> {
  String page = "trending";
  @override
  void initState() {
    super.initState();
  }

  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    //This makes the view model accessible to the views using stacked
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) {},
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.peachColor,
              body: SizedBox(
                height: Responsive.height(context),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Responsive.height(context) / 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: AnimationLimiter(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 1000),
                                childAnimationBuilder: (widget) =>
                                    SlideAnimation(
                                  horizontalOffset:
                                      -MediaQuery.of(context).size.width / 2,
                                  child: FadeInAnimation(
                                      curve: Curves.fastOutSlowIn,
                                      child: widget),
                                ),
                                children: [
                                  const Text(
                                    'Discover',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: AppColors.black),
                                  ),
                                  const Text(
                                    'New items',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                        color: AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        height: Responsive.height(context) / 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: AnimationLimiter(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:
                                    AnimationConfiguration.toStaggeredList(
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
                                    SizedBox(
                                      width: Responsive.width(context) / 1.5,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.search_outlined,
                                            color: AppColors.black,
                                            size: 30,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 2.0, horizontal: 20.0),
                                          hintText: "Search products",
                                          hintStyle: TextStyle(
                                            color: Color(0XFF818181),
                                            fontSize: 17,
                                          ),
                                          fillColor: Colors.white,
                                          filled: true,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0),
                                            ),
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      width: 50,
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(10),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  10.0)), // Set rounded corner radius
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Colors.black,
                                                offset: Offset(1, 3))
                                          ] // Make rounded corner of border
                                          ),
                                      child: const Icon(
                                        Icons.alt_route,
                                        color: AppColors.white,
                                      ),
                                    )
                                  ],
                                )),
                          )),
                      SizedBox(
                        height: Responsive.height(context) / 35,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: AnimationLimiter(
                              child: Row(
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 300),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset:
                                  -MediaQuery.of(context).size.width / 4,
                              child: FadeInAnimation(
                                  curve: Curves.fastOutSlowIn, child: widget),
                            ),
                            children: [
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      page = "trending";
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "Trending",
                                        style: TextStyle(
                                            color: page == "trending"
                                                ? AppColors.red
                                                : AppColors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      page == "trending"
                                          ? Container(
                                              height: 2,
                                              width: 30,
                                              color: AppColors.red,
                                            )
                                          : Container()
                                    ],
                                  )),
                              const SizedBox(
                                width: 70,
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      page = "chairs";
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "Chairs",
                                        style: TextStyle(
                                            color: page == "chairs"
                                                ? AppColors.red
                                                : AppColors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      page == "chairs"
                                          ? Container(
                                              height: 2,
                                              width: 20,
                                              color: AppColors.red,
                                            )
                                          : Container()
                                    ],
                                  )),
                              const SizedBox(
                                width: 70,
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      page = "decor";
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        "Decor",
                                        style: TextStyle(
                                            color: page == "decor"
                                                ? AppColors.red
                                                : AppColors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      page == "decor"
                                          ? Container(
                                              height: 2,
                                              width: 20,
                                              color: AppColors.red,
                                            )
                                          : Container()
                                    ],
                                  )),
                            ],
                          )))),
                      SizedBox(
                        height: Responsive.height(context) / 30,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Container(
                            height: Responsive.height(context) / 2.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: AnimationLimiter(
                              child: page == "trending"
                                  ? ListView.builder(
                                      itemCount: model.trendingList.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                  transitionDuration:
                                                      const Duration(
                                                          milliseconds: 900),
                                                  pageBuilder: (_, __, ___) =>
                                                      Details(
                                                          items: model
                                                                  .trendingList[
                                                              index],
                                                          type: page)));
                                        },
                                        child: AnimationConfiguration
                                            .staggeredList(
                                          position: index,
                                          duration: const Duration(
                                              milliseconds: 1200),
                                          child: SlideAnimation(
                                              horizontalOffset: 300.0,
                                              curve: Curves.easeInOut,
                                              child: FadeInAnimation(
                                                  curve: Curves.easeIn,
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10.0,
                                                              left: 10),
                                                      child: ItemWidget(
                                                        items:
                                                            model.trendingList[
                                                                index],
                                                      )))),
                                        ),
                                      ),
                                    )
                                  : page == "chairs"
                                      ? ListView.builder(
                                          itemCount: model.chairList.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                      transitionDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  900),
                                                      pageBuilder: (_, __,
                                                              ___) =>
                                                          Details(
                                                              items: model
                                                                      .chairList[
                                                                  index],
                                                              type: page)));
                                            },
                                            child: AnimationConfiguration
                                                .staggeredList(
                                              position: index,
                                              duration: const Duration(
                                                  milliseconds: 1200),
                                              child: SlideAnimation(
                                                  horizontalOffset: 300.0,
                                                  curve: Curves.easeInOut,
                                                  child: FadeInAnimation(
                                                      curve: Curves.easeIn,
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10.0,
                                                                  left: 10),
                                                          child: ItemWidget(
                                                            items:
                                                                model.chairList[
                                                                    index],
                                                          )))),
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          itemCount: model.decoList.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  PageRouteBuilder(
                                                      transitionDuration:
                                                          const Duration(
                                                              milliseconds:
                                                                  900),
                                                      pageBuilder: (_, __,
                                                              ___) =>
                                                          Details(
                                                              items: model
                                                                      .decoList[
                                                                  index],
                                                              type: page)));
                                            },
                                            child: AnimationConfiguration
                                                .staggeredList(
                                              position: index,
                                              duration: const Duration(
                                                  milliseconds: 1200),
                                              child: SlideAnimation(
                                                  horizontalOffset: 300.0,
                                                  curve: Curves.easeInOut,
                                                  child: FadeInAnimation(
                                                      curve: Curves.easeIn,
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10.0,
                                                                  left: 10),
                                                          child: ItemWidget(
                                                            items:
                                                                model.decoList[
                                                                    index],
                                                          )))),
                                            ),
                                          ),
                                        ),
                            ),
                          )),
                    ]),
                //bottomNavigationBar:
              ));
        });
  }
}
