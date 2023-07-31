import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hyll/data/models/feed_entity.dart';
import 'package:hyll/theme_manager/adaptive_theme/adaptive_theme.dart';
import 'package:hyll/theme_manager/theme_fonts.dart';
import 'package:hyll/utils/common_utils.dart';
import 'package:hyll/presentation/widgets/error_widget.dart' as EW;
import 'package:get/get.dart';

class FeaturedImage extends StatelessWidget {

  FeedContents content;

  FeaturedImage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child: CommonUtils.checkIfNotNull(content.contentUrl)
              ? CachedNetworkImage(
            width: Get.width,
            height: Get.height,
            imageUrl: content.contentUrl!,
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: Container(
                height: 60,
                width: 60,
                padding: EdgeInsets.all(8),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AdaptiveTheme.getCurrentInvertColor(),
                ),
              ),
            ),
            errorWidget: (context, url, error) => EW.ErrorWidget(),
          )
              : EW.ErrorWidget(),
        ),
        if (CommonUtils.checkIfNotNull(content.contentSource?.title))
          Positioned(
            top: 0,
            child: Container(
              width: Get.width,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 15, top: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AdaptiveTheme.getCurrentMainColor().withOpacity(.1),
                    AdaptiveTheme.getCurrentMainColor().withOpacity(.5),
                    AdaptiveTheme.getCurrentMainColor().withOpacity(.8),
                    AdaptiveTheme.getCurrentMainColor()
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.05, 0.3, 0.5, 1],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    content.contentSource?.title ?? '',
                    textAlign: TextAlign.center,
                    style: ThemeFonts.semiBold(textColor: AdaptiveTheme.getCurrentInvertColor()),
                  ),
                ),
              ),
            ),
          ),
      ],
    );;
  }
}
