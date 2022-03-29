import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:stacked/stacked.dart';
import 'package:teamapttest/ui/screens/cart/cart_view_model.dart';
import 'package:teamapttest/ui/screens/favorite/favorite_view_model.dart';
import 'package:teamapttest/ui/screens/home/details_view.dart';
import 'package:teamapttest/ui/widget/fav_widget.dart';
import 'package:teamapttest/ui/widget/items_widget.dart';
import 'package:teamapttest/utils/colors.dart';

//List of employees screen

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CartPageState();
  }
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        onModelReady: (v) {
          v.getCart();
        },
        viewModelBuilder: () => CartViewModel(),
        builder: (context, model, child) {
          return Scaffold(
              backgroundColor: AppColors.peachColor,
              body: model.cartList.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: Text(
                            'No item added yet',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: AppColors.primaryColor),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Once you add to cart you will see your item here',
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
                                        'Cart',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: AppColors.black),
                                      ),
                                      const Text(
                                        'Cart items',
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
                            height: 100,
                          ),
                          SizedBox(
                              height: 400,
                              child: ListView.builder(
                                itemCount: model.cartList.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {},
                                  child: AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration:
                                        const Duration(milliseconds: 1200),
                                    child: SlideAnimation(
                                        horizontalOffset: 300.0,
                                        curve: Curves.easeInOut,
                                        child: FadeInAnimation(
                                            curve: Curves.easeIn,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0, left: 10),
                                                child: FavWidget(
                                                  items: model.cartList[index],
                                                  onPressed: () {},
                                                  onDelete: () {
                                                    model.deleteCart(
                                                        model.cartList[index]);
                                                  },
                                                )))),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                              child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                      height: 60,
                                      width: 300,
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
                                            "Proceed to checkout",
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Icon(
                                            Icons.payments_outlined,
                                            color: AppColors.white,
                                          ),
                                        ],
                                      ))))
                        ]));
        });
  }
}
