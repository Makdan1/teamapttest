import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teamapttest/ui/screens/bottom_navigation/bottom_nav_model_view.dart';
import 'package:teamapttest/ui/screens/cart/cart.dart';
import 'package:teamapttest/ui/screens/favorite/favorite.dart';
import 'package:teamapttest/ui/screens/home/home_view.dart';
import 'package:teamapttest/utils/colors.dart';
import 'package:teamapttest/utils/screensize.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<BottomNavigation>
    with TickerProviderStateMixin {
  AnimationController? _navController;
  Animation<Offset>? _navAnimation;

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const Home();

      case 1:
        return  FavoritePage();
      case 2:
        return const CartPage();
      default:
        return const Home();
    }
  }

  @override
  void initState() {
    _navController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..forward();
    _navAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.99),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _navController!,
      curve: Curves.easeIn,
    ));

    super.initState();
  }

  @override
  void dispose() {
    _navController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(builder: (context, model, _) {
      return Scaffold(
          backgroundColor: AppColors.white,
          body: Stack(
            children: [
              getViewForIndex(model.currentTabIndex),
              Positioned(
                  bottom:Responsive.height(context)/30,
                  right: 10,
                  left: 10,
                  child: SlideTransition(
                    position: _navAnimation!,
                    textDirection: TextDirection.rtl,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                              color: AppColors.black.withOpacity(.05),
                              spreadRadius: -2 // changes position of shadow
                              ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 17.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                                onTap: () {
                                  model.setCurrentTabTo(newTabIndex: 0);
                                },
                                child: Icon(
                                  Icons.home_outlined,
                                  color: model.currentTabIndex == 0
                                      ? AppColors.primaryColor
                                      : AppColors.white,
                                  size: 27,
                                )),
                            InkWell(
                                onTap: () {
                                  model.setCurrentTabTo(newTabIndex: 1);
                                },
                                child: Icon(
                                  Icons.favorite_border,
                                  color: model.currentTabIndex == 1
                                      ? AppColors.primaryColor
                                      : AppColors.white,
                                  size: 27,
                                )),
                            InkWell(
                                onTap: () {
                                  model.setCurrentTabTo(newTabIndex: 2);
                                },
                                child: Icon(
                                  Icons.add_shopping_cart,
                                  color: model.currentTabIndex == 2
                                      ? AppColors.primaryColor
                                      : AppColors.white,
                                  size: 27,
                                )),
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          )

          // bottomNavigationBar: BottomNavigationBar(
          //    type: BottomNavigationBarType.fixed,
          //    onTap: (newTab) {
          //      model.setCurrentTabTo(newTabIndex: newTab);
          //    },
          //   currentIndex: model.currentTabIndex,
          //    items: [
          //      BottomNavigationBarItem(
          //        icon: SvgPicture.asset(
          //          "assets/images/home.svg",
          //          width: 23.0,
          //          color: model.currentTabIndex == 0
          //              ? AppColors.primaryColor
          //              : Colors.black,
          //        ),
          //        label: 'Home',
          //      ),
          //      BottomNavigationBarItem(
          //        icon: SvgPicture.asset(
          //          "assets/images/note.svg",
          //          width: 23.0,
          //          color: model.currentTabIndex == 1
          //              ? AppColors.primaryColor
          //              : Colors.black,
          //        ),
          //        label: 'Topic',
          //      ),
          //      BottomNavigationBarItem(
          //        icon: SvgPicture.asset(
          //          "assets/images/post.svg",
          //          width: 23.0,
          //          color: model.currentTabIndex == 2
          //              ? AppColors.primaryColor
          //              : Colors.black,
          //        ),
          //        label: 'Post',
          //      ),
          //      BottomNavigationBarItem(
          //        icon: SvgPicture.asset(
          //              "assets/images/chat.svg",
          //              width: 23.0,
          //              color: model.currentTabIndex == 3
          //                  ? AppColors.primaryColor
          //                  : Colors.black,
          //            ),
          //        label: 'Chat',
          //      ),
          //
          //    ],
          //    selectedItemColor: AppColors.primaryColor,
          //  ),
          );
    });
  }
}
