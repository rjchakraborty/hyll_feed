import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hyll/controller/general_controller.dart';
import 'package:hyll/entities/slider_entity.dart';
import 'package:hyll/modules/home/provider/home_provider.dart';
import 'package:hyll/theme_manager/adaptive_theme/adaptive_theme.dart';
import 'package:hyll/theme_manager/theme_fonts.dart';
import 'package:hyll/utils/HexColor.dart';
import 'package:hyll/utils/app_constants.dart';
import 'package:hyll/utils/common_utils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  late PageController _page_controller = PageController(initialPage: 0);
  RxString nextLink = ''.obs;
  RxString prevLink = ''.obs;
  RxInt count = 0.obs;
  RxBool _autoplay = false.obs;
  RxInt _current = 0.obs;
  RxList<SliderEntity> sliderList = <SliderEntity>[].obs;
  final CarouselController _carousel_controller = CarouselController();
  late RefreshController refreshController;

  getTagsView(List<String>? tagList) {
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
                padding: const EdgeInsets.only(left:2, right: 5),
                child: Text(
                  (tagList[index] ?? '').removeAllWhitespace.replaceAll("_", " ").toTitleCase(),
                  style: ThemeFonts.p3Regular(
                      textColor: AdaptiveTheme.getCurrentInvertColor()),
                ),
              ),
              if (index != (tagList.length - 1))
                Container(
                  height: 6.21,
                  width: 5.33,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      color: AdaptiveTheme.getCurrentInvertColor(),
                      borderRadius: BorderRadius.circular(3)),
                )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
      return listView;
    }
  }

  getGridView(List<SliderGridInfo>? gridList) {
    if (gridList != null && gridList.isNotEmpty) {
      ListView listView = ListView();
      listView = ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: gridList.length,
        itemBuilder: (BuildContext context, int index) {
          return (CommonUtils.checkIfNotNull(gridList[index].iconUrl) &&
                  CommonUtils.checkIfNotNull(gridList[index].value))
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
                          progressIndicatorBuilder: (context, url, progress) =>
                              Center(
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
                          errorWidget: (context, url, error) =>
                              getErrorWidget(),
                        ),
                      if (CommonUtils.checkIfNotNull(gridList[index].value))
                        ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 55),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              gridList[index].value?.toTitleCase() ?? '',
                              textAlign: TextAlign.center,
                              style: ThemeFonts.p3Regular(
                                  textColor:
                                      AdaptiveTheme.getCurrentInvertColor()),
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
      return Center(child: listView,);
    }
  }

  getErrorWidget() {
    return Container(
      width: Get.width,
      height: Get.height * .9,
      decoration: BoxDecoration(
          color: AdaptiveTheme.getCurrentMainColor(),
          image: DecorationImage(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.contain)),
    );
  }

  Widget getFeaturedImageWidget(SliderContents content) {
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
                  errorWidget: (context, url, error) => getErrorWidget(),
                )
              : getErrorWidget(),
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
                        style: ThemeFonts.semiBold(
                            textColor: AdaptiveTheme.getCurrentInvertColor()),
                      ),
                    ),
              ),
            ),
          ),
      ],
    );
  }

  getFeaturedItem(SliderEntity mSlider) {
    if (mSlider.contents != null && mSlider.contents!.isNotEmpty) {
      final features = List.generate(
        mSlider.contents!.length,
        (index) {
          return getFeaturedImageWidget(mSlider.contents![index]);
        },
      );

      return Stack(
        children: [
          Obx(() => CarouselSlider(
                items: features,
                carouselController: _carousel_controller,
                options: CarouselOptions(
                    height: Get.height,
                    autoPlay: _autoplay.value,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      _current.value = index;
                    }),
              )),
          Positioned(
            bottom: 0,
            child: Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    AdaptiveTheme.getCurrentMainColor(),
                    AdaptiveTheme.getCurrentMainColor()
                  ],
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
                      child: getGridView(mSlider.gridInfo),
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
                          mSlider.title ?? '',
                          textAlign: TextAlign.start,
                          style: ThemeFonts.semiBold(
                              textColor: AdaptiveTheme.getCurrentInvertColor()),
                        ),
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Center(
                    child: SizedBox(
                      height: Get.height * .03,
                      width: Get.width,
                      child: getTagsView(mSlider.tags),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ReadMoreText(
                      mSlider.description ?? '',
                      trimLines: 2,
                      style: ThemeFonts.p3Regular(
                          textColor: AdaptiveTheme.getCurrentInvertColor()),
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '...Show more',
                      trimExpandedText: ' show less',
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
                            children:
                                mSlider.contents!.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () => _carousel_controller
                                    .animateToPage(entry.key),
                                child: Obx(() => Container(
                                      width: 8,
                                      height: 8,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AdaptiveTheme
                                                  .getCurrentInvertColor()
                                              .withOpacity(
                                                  _current.value == entry.key
                                                      ? 0.9
                                                      : 0.4)),
                                    )),
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
      );
    }
  }

  final _random = new Random();

  int next(int min, int max) => min + _random.nextInt(max - min);

  getSliderShimmerItem() {
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
                color:
                    HexColor.getColor(PRIMARY_ACCENT_COLOR_HEX).withOpacity(.5),
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
                  color: HexColor.getColor(PRIMARY_ACCENT_COLOR_HEX)
                      .withOpacity(.5),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 11),
                height: 14,
                width: next(100, 150).toDouble(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: HexColor.getColor(PRIMARY_ACCENT_COLOR_HEX)
                      .withOpacity(.5),
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
              color:
                  HexColor.getColor(PRIMARY_ACCENT_COLOR_HEX).withOpacity(.5),
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
    );
  }

  getShimmerView() {
    return Shimmer.fromColors(
      baseColor: HexColor.getColor(DARK_GREY_COLOR_HEX),
      highlightColor: HexColor.getColor(DARK_GREY_COLOR_HEX).withOpacity(.85),
      enabled: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            getSliderShimmerItem(),
            getSliderShimmerItem(),
            getSliderShimmerItem(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  getNoContentDisplay() {
    return Column(
      children: <Widget>[
        const Padding(padding: EdgeInsets.all(10.0)),
        Container(
          height: 300,
          width: 300,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                  fit: BoxFit.contain)),
        ),
        const Padding(padding: EdgeInsets.all(10.0)),
        GeneralController.to.isConnected.value
            ? Text(
                'There are no adventures happening!',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: FONT_LIGHT),
                textAlign: TextAlign.center,
              )
            : Text(
                NO_INTERNET,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: FONT_LIGHT),
                textAlign: TextAlign.center,
              ),
      ],
    );
  }

  void _onRefresh() async {
    // monitor network fetch
    await callHomeAPI();
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(seconds: 1));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    refreshController.loadComplete();
  }

  getListView() {
    refreshController = RefreshController(initialRefresh: false);
    Widget mainStack = PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: HomeController.to.sliderList.length,
      controller: _page_controller,
      onPageChanged: (index) {},
      itemBuilder: (context, index) {
        return getFeaturedItem(HomeController.to.sliderList[index]);
      },
    );

    SmartRefresher smartRefresher = SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      header: const WaterDropHeader(),
      controller: refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: mainStack,
    );

    return smartRefresher;
  }

  callHomeAPI() async {
    await HomeProvider().fetchHomeSliderAPI(
        onSuccess: (List<SliderEntity>? list) async {
      sliderList.clear();
      if (list != null) {
        sliderList.value = list;
      }
    });
  }
}
