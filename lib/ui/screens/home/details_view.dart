import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:teamapttest/core/model/Items.dart';
import 'package:teamapttest/ui/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:teamapttest/ui/widget/details_widget.dart';
import 'package:teamapttest/utils/colors.dart';
import 'package:teamapttest/utils/locator.dart';
import 'package:teamapttest/utils/router/navigation_service.dart';
import 'package:stacked/stacked.dart';

class Details extends StatefulWidget {
  final Items items;
  final String type;
  const Details({Key? key, required this.items, required this.type})
      : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Details> {
  final NavigationService _navigationService = locator<NavigationService>();
  int _current = 0;
  final CarouselController _controller = CarouselController();
  String colorSelected = "green";
  bool favorite = false;
  int count = 0;
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
              backgroundColor: AppColors.peachColor,
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.white,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _navigationService.pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios,
                              color: AppColors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: AnimationLimiter(
                              child: CarouselSlider.builder(
                                  itemCount: widget.type == "trending"
                                      ? model.trendingList.length
                                      : widget.type == "chairs"
                                          ? model.chairList.length
                                          : model.decoList.length,
                                  carouselController: _controller,
                                  options: CarouselOptions(
                                      aspectRatio: 1.9 / 1.7,
                                      enlargeCenterPage: false,
                                      autoPlay: true,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          _current = index;
                                        });
                                      }),
                                  itemBuilder: (ctx, index, realIdx) {
                                    return AnimationConfiguration.staggeredList(
                                        position: index,
                                        duration:
                                            const Duration(milliseconds: 1200),
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
                                                    child: DetailsWidget(
                                                      items: widget.type ==
                                                              "trending"
                                                          ? model.trendingList[
                                                              index]
                                                          : widget.type ==
                                                                  "chairs"
                                                              ? model.chairList[
                                                                  index]
                                                              : model.decoList[
                                                                  index],
                                                      onPressed: () {},
                                                    )))));
                                  }))),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: model.decoList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : _current == entry.key
                                          ? AppColors.red
                                          : AppColors.white)),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.items.title!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                              Text(
                                widget.items.subtitle!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                              ),
                            ],
                          ),
                          Text(
                            "\$ ${widget.items.price!}",
                            style: const TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 30),
                          ),
                        ],
                      ),
                      Text(
                        widget.items.description!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              colorSelected == "green"
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          colorSelected = "green";
                                        });
                                      },
                                      child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor:
                                              AppColors.green.withOpacity(0.3),
                                          child: const CircleAvatar(
                                            radius: 14,
                                            backgroundColor: AppColors.green,
                                          )))
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          colorSelected = "green";
                                        });
                                      },
                                      child: const CircleAvatar(
                                        radius: 14,
                                        backgroundColor: AppColors.green,
                                      )),
                              const SizedBox(
                                width: 10,
                              ),
                              colorSelected == "brown"
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          colorSelected = "brown";
                                        });
                                      },
                                      child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: AppColors.lowGrey
                                              .withOpacity(0.3),
                                          child: const CircleAvatar(
                                            radius: 14,
                                            backgroundColor: AppColors.lowGrey,
                                          )))
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          colorSelected = "brown";
                                        });
                                      },
                                      child: const CircleAvatar(
                                        radius: 14,
                                        backgroundColor: AppColors.lowGrey,
                                      )),
                              const SizedBox(
                                width: 10,
                              ),
                              colorSelected == "pink"
                                  ? InkWell(
                                      onTap: () {
                                        setState(() {
                                          colorSelected = "pink";
                                        });
                                      },
                                      child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor:
                                              AppColors.red.withOpacity(0.1),
                                          child: CircleAvatar(
                                            radius: 14,
                                            backgroundColor:
                                                AppColors.red.withOpacity(0.3),
                                          )))
                                  : InkWell(
                                      onTap: () {
                                        setState(() {
                                          colorSelected = "pink";
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: 14,
                                        backgroundColor:
                                            AppColors.red.withOpacity(0.3),
                                      )),
                            ],
                          ),
                          Container(
                              height: 30,
                              width: 110,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.red.withOpacity(0.2),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                        20.0)), // Set rounded corner radius/ Make rounded corner of border
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (count != 0) {
                                            count--;
                                          }
                                        });
                                      },
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(Icons.remove)),
                                  Text(
                                    count.toString(),
                                    style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: AppColors.black,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () {
                                        setState(() {
                                          count++;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                              onTap: () {
                                if (favorite) {
                                  model.deleteFavorite(widget.items);
                                  setState(() {
                                    favorite = false;
                                  });
                                } else {
                                  model.saveFavorite(widget.items);
                                  setState(() {
                                    favorite = true;
                                  });
                                }
                              },
                              child: CircleAvatar(
                                backgroundColor: AppColors.white,
                                child: favorite
                                    ? const Icon(
                                        Icons.favorite,
                                        color: AppColors.red,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                        color: AppColors.black,
                                      ),
                              )),
                          const SizedBox(
                            width: 50,
                          ),
                          InkWell(
                              onTap: () {
                                model.saveCart(widget.items);
                              },
                              child: Container(
                                  height: 60,
                                  width: 200,
                                  margin: const EdgeInsets.all(10),
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              20.0)), // Set rounded corner radius
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 10,
                                            color: Colors.black,
                                            offset: Offset(1, 3))
                                      ] // Make rounded corner of border
                                      ),
                                  child: Row(
                                    children: const [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Add to cart",
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Icon(
                                        Icons.add_shopping_cart,
                                        color: AppColors.white,
                                      ),
                                    ],
                                  )))
                        ],
                      )
                    ]),
                //bottomNavigationBar:
              ));
        });
  }
}
