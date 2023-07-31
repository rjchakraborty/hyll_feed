import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hyll/blocs/carousel/carousel_bloc.dart';
import 'package:hyll/blocs/carousel/carousel_event.dart';
import 'package:hyll/data/models/feed_entity.dart';
import 'package:hyll/presentation/widgets/featured_image.dart';
import 'package:hyll/presentation/widgets/grid_item.dart';
import 'package:hyll/presentation/widgets/tags_view.dart';
import 'package:hyll/theme_manager/adaptive_theme/adaptive_theme.dart';
import 'package:hyll/theme_manager/theme_fonts.dart';
import 'package:readmore/readmore.dart';

class FeaturedItem extends StatelessWidget {
  FeedEntity mFeed;
  final bool _autoplay = true;
  final CarouselController _carousel_controller = CarouselController();

  FeaturedItem({super.key, required this.mFeed});

  @override
  Widget build(BuildContext context) {
    if (mFeed.contents != null && mFeed.contents!.isNotEmpty) {
      final features = List.generate(
        mFeed.contents!.length,
        (index) {
          return FeaturedImage(content: mFeed.contents![index],);
        },
      );

      return SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            CarouselSlider(
              items: features,
              carouselController: _carousel_controller,
              options: CarouselOptions(
                  height: Get.height,
                  autoPlay: _autoplay,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    context.read<CarouselBloc>().add(ChangeIndicatorEvent(index: index));
                  }),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.transparent, AdaptiveTheme.getCurrentMainColor(), AdaptiveTheme.getCurrentMainColor()],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.2, 0.3, 1],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: Get.height * .09,
                        width: Get.width,
                        child: GridItem(gridList: mFeed.gridInfo ?? [],),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: Text(
                            mFeed.title ?? '',
                            textAlign: TextAlign.start,
                            style: ThemeFonts.semiBold(textColor: AdaptiveTheme.getCurrentInvertColor()),
                          ),
                        )),
                    SizedBox(
                      height: 2,
                    ),
                    Center(
                      child: SizedBox(
                        height: Get.height * .03,
                        width: Get.width,
                        child: TagsView(tagList: mFeed.tags ?? [],),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ReadMoreText(
                        mFeed.description ?? '',
                        trimLines: 2,
                        style: ThemeFonts.p3Regular(textColor: AdaptiveTheme.getCurrentInvertColor()),
                        colorClickableText: AdaptiveTheme.getCurrentInvertColor(),
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...Show More',
                        trimExpandedText: ' Show Less',
                      ),
                    ),
                    Center(
                      child: Container(
                          padding: EdgeInsets.all(10),
                          width: Get.width * .9,
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: mFeed.contents!.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () => _carousel_controller.animateToPage(entry.key),
                                  child: BlocBuilder<CarouselBloc, int>(
                                    builder: (context, state) {
                                      return Container(
                                        width: 8,
                                        height: 8,
                                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AdaptiveTheme.getCurrentInvertColor().withOpacity(state == entry.key ? 0.9 : 0.4)),
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
