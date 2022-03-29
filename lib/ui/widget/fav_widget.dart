import 'package:flutter/material.dart';
import 'package:teamapttest/core/model/Items.dart';
import 'package:teamapttest/utils/colors.dart';

class FavWidget extends StatelessWidget {
  final Function onPressed;
  final Function onDelete;
  final Items items;

  FavWidget(
      {required this.onPressed,
      required this.onDelete,
      required this.items,});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      child: Stack(children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              "assets/images/${items.asset}",
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
                  items.title!,
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
                      items.subtitle!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.white),
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      ),
                      onTap: () {
                        onDelete();
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
