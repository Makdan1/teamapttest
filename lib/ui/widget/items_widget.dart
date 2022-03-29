
import 'package:flutter/material.dart';
import 'package:teamapttest/core/model/Items.dart';
import 'package:teamapttest/ui/screens/home/home_view_model.dart';
import 'package:teamapttest/utils/colors.dart';

class ItemWidget extends StatefulWidget {
  final Items items;

  ItemWidget(
      {required this.items});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool? loved = false;
  HomeViewModel model = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              "assets/images/${widget.items.asset}",
              fit: BoxFit.fill,
              height: 380,
              width: 220,
            )),
        Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 320,
                ),
                Text(
                  widget.items.title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: AppColors.white),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.items.subtitle!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.white),
                    ),
                    loved!
                        ? InkWell(
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 18,
                            ),
                            onTap: () {
                              if (loved!) {
                                model.deleteFavorite(widget.items);
                                setState(() {
                                  loved = false;
                                });
                              } else {
                                model.saveFavorite(widget.items);
                                setState(() {
                                  loved = true;
                                });
                              }
                            },
                          )
                        : InkWell(
                            child: const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 18,
                            ),
                            onTap: () {
                              if (loved!) {
                                model.deleteFavorite(widget.items);
                                setState(() {
                                  loved = false;
                                });
                              } else {
                                model.saveFavorite(widget.items);
                                setState(() {
                                  loved = true;
                                });
                              }
                            },
                          )
                  ],
                ),
              ],
            ))
      ]),
    );
  }
}
