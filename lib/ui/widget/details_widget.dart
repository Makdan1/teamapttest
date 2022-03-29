import 'package:flutter/material.dart';
import 'package:teamapttest/core/model/Items.dart';
import 'package:teamapttest/utils/colors.dart';

class DetailsWidget extends StatelessWidget {
  final Function onPressed;
  final Items items;

  DetailsWidget({required this.onPressed, required this.items});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image.asset(
            "assets/images/${items.asset}",
            fit: BoxFit.fill,
          )),
    );
  }
}
