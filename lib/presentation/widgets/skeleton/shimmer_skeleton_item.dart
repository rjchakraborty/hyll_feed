import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyll/utils/HexColor.dart';
import 'package:hyll/utils/app_constants.dart';

class ShimmerSkeletonItem extends StatelessWidget {

  final _random = new Random();
  int next(int min, int max) => min + _random.nextInt(max - min);


  ShimmerSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    ListView listView = ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                margin: const EdgeInsets.only(bottom: 8, left: 11),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                color: HexColor.getColor(PRIMARY_ACCENT_COLOR_HEX).withOpacity(.5),
                elevation: 10,
                child: Container(
                  height: 223,
                  width: 157,
                ),
              ),
              Container(
                height: 11,
                width: next(50, 100).toDouble(),
                margin: const EdgeInsets.only(left: 11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: HexColor.getColor(PRIMARY_ACCENT_COLOR_HEX).withOpacity(.5),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 11),
                height: 14,
                width: next(100, 150).toDouble(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: HexColor.getColor(PRIMARY_ACCENT_COLOR_HEX).withOpacity(.5),
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

    return Container(
      width: Get.width,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 20,
            width: next(100, 200).toDouble(),
            margin: const EdgeInsets.fromLTRB(25, 10, 15, 10),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: HexColor.getColor(PRIMARY_ACCENT_COLOR_HEX).withOpacity(.5),
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height * .4,
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: listView,
          )
        ],
      ),
    );;
  }
}
