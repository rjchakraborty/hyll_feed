import 'package:flutter/material.dart';
import 'package:hyll/blocs/feed/feed_bloc.dart';
import 'package:hyll/blocs/feed/feed_event.dart';
import 'package:hyll/data/models/feed_entity.dart';
import 'package:hyll/presentation/widgets/featured_item.dart';
import 'package:hyll/utils/common_utils.dart';
import 'package:provider/provider.dart';

class PageBuilderWidget extends StatelessWidget {

  final PageController _page_controller = PageController(initialPage: 0);
  List<FeedEntity> feedList;
  String? nextUrl;

  PageBuilderWidget({super.key, required this.feedList, this.nextUrl});

  @override
  Widget build(BuildContext context) {
    Widget mainStack = PageView.builder(
      key: PageStorageKey<String>('feed'),
      scrollDirection: Axis.vertical,
      itemCount: feedList.length,
      controller: _page_controller,
      onPageChanged: (index) {
        if (feedList.isNotEmpty && feedList.length > 2 && index == feedList.length - 2 && CommonUtils.checkIfNotNull(nextUrl)) {
          context.read<FeedBloc>().add(fetchAllFeedEvent(url: nextUrl, existingFeed: feedList, showLoading: false));
        }
      },
      itemBuilder: (context, index) {
        return FeaturedItem(mFeed: feedList[index]);
      },
    );
    return mainStack;
  }
}
