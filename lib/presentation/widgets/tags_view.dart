import 'package:flutter/material.dart';
import 'package:hyll/theme_manager/adaptive_theme/adaptive_theme.dart';
import 'package:hyll/theme_manager/theme_fonts.dart';
import 'package:get/get.dart';
import 'package:hyll/utils/common_utils.dart';

class TagsView extends StatelessWidget {
  List<String> tagList = [];

  TagsView({super.key, required this.tagList});

  @override
  Widget build(BuildContext context) {
    if (tagList != null && tagList.isNotEmpty) {
      ListView listView = ListView();
      listView = ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 5),
                child: Text(
                  (tagList[index] ?? '').removeAllWhitespace.replaceAll("_", " ").toTitleCase(),
                  style: ThemeFonts.p3Regular(textColor: AdaptiveTheme.getCurrentInvertColor()),
                ),
              ),
              if (index != (tagList.length - 1))
                Container(
                  height: 6.21,
                  width: 5.33,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(color: AdaptiveTheme.getCurrentInvertColor(), borderRadius: BorderRadius.circular(3)),
                )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
      return listView;
    } else {
      return SizedBox.shrink();
    }
  }
}
