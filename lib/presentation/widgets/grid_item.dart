import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyll/data/models/feed_entity.dart';
import 'package:hyll/theme_manager/adaptive_theme/adaptive_theme.dart';
import 'package:hyll/theme_manager/theme_fonts.dart';
import 'package:hyll/utils/HexColor.dart';
import 'package:hyll/utils/app_constants.dart';
import 'package:hyll/utils/common_utils.dart';
import 'package:hyll/presentation/widgets/error_widget.dart' as EW;

class GridItem extends StatelessWidget {

  List<FeedGridInfo> gridList = [];

  GridItem({super.key, this.gridList = const []});

  @override
  Widget build(BuildContext context) {
    if (gridList != null && gridList.isNotEmpty) {
      ListView listView = ListView();
      listView = ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: gridList.length,
        itemBuilder: (BuildContext context, int index) {
          return (CommonUtils.checkIfNotNull(gridList[index].iconUrl) && CommonUtils.checkIfNotNull(gridList[index].value))
              ? Container(
                  height: Get.height * .07,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (CommonUtils.checkIfNotNull(gridList[index].iconUrl))
                        CachedNetworkImage(
                          width: 30,
                          height: 30,
                          imageUrl: gridList[index].iconUrl!,
                          fit: BoxFit.fill,
                          progressIndicatorBuilder: (context, url, progress) => Center(
                            child: Container(
                              height: 20,
                              width: 20,
                              padding: EdgeInsets.all(8),
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                                color: AdaptiveTheme.getCurrentInvertColor(),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => EW.ErrorWidget(),
                        ),
                      if (CommonUtils.checkIfNotNull(gridList[index].value))
                        ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 55),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                            child: Text(
                              gridList[index].value?.toTitleCase() ?? '',
                              textAlign: TextAlign.center,
                              style: ThemeFonts.p3Medium(textColor: HexColor.getColor(PRIMARY_DARK_COLOR_HEX)),
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              : SizedBox.shrink();
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
      return Center(
        child: listView,
      );
    } else {
      return SizedBox.expand();
    }
  }
}
