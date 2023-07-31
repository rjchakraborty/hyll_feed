import 'package:flutter/material.dart';
import 'package:hyll/presentation/widgets/skeleton/shimmer_skeleton_item.dart';
import 'package:hyll/utils/HexColor.dart';
import 'package:hyll/utils/app_constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatelessWidget {
  const ShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: HexColor.getColor(PRIMARY_COLOR_HEX),
      highlightColor: HexColor.getColor(PRIMARY_DARK_COLOR_HEX).withOpacity(.85),
      enabled: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            ShimmerSkeletonItem(),
            ShimmerSkeletonItem(),
            ShimmerSkeletonItem(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );;
  }
}
