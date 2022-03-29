import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stacked/stacked.dart';
import 'package:teamapttest/ui/screens/favorite/favorite_view_model.dart';
import 'package:teamapttest/ui/screens/home/details_view.dart';
import 'package:teamapttest/ui/widget/fav_widget.dart';
import 'package:teamapttest/ui/widget/items_widget.dart';
import 'package:teamapttest/utils/colors.dart';

//List of employees screen

class FavoritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FavoritePageState();
  }
}

class FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavViewModel>.reactive(
        onModelReady: (v) {
          v.getFavorites();
        },
        viewModelBuilder: () => FavViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.peachColor,
              body: model.employeeDataList.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: Text(
                            'No Favorite added yet',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: AppColors.primaryColor),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Tap on the favorite icon of an item to add',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: AnimationLimiter(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                    duration: const Duration(milliseconds: 500),
                                    childAnimationBuilder: (widget) =>
                                        SlideAnimation(
                                      horizontalOffset:
                                          MediaQuery.of(context).size.width / 4,
                                      child: FadeInAnimation(
                                          curve: Curves.fastOutSlowIn,
                                          child: widget),
                                    ),
                                    children: [
                                      const Text(
                                        'Favorites',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: AppColors.black),
                                      ),
                                      const Text(
                                        'Saved items',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 50,
                          ),
                          Expanded(
                              child: ListView.builder(
                            itemCount: model.employeeDataList.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        transitionDuration:
                                            const Duration(milliseconds: 900),
                                        pageBuilder: (_, __, ___) => Details(
                                            items:
                                                model.employeeDataList[index],
                                            type: "trending")));
                              },
                              child: AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 1200),
                                child: SlideAnimation(
                                    horizontalOffset: 300.0,
                                    curve: Curves.easeInOut,
                                    child: FadeInAnimation(
                                        curve: Curves.easeIn,
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10.0, left: 10),
                                            child: FavWidget(
                                              items:
                                                  model.employeeDataList[index],
                                              onPressed: () {},
                                              onDelete: () {
                                                model.deleteFavorite(model
                                                    .employeeDataList[index]);
                                              },
                                            )))),
                              ),
                            ),
                          )),
                        ]));
        });
  }
}
