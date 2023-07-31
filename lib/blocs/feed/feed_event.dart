import 'package:hyll/data/models/feed_entity.dart';

abstract class FeedEvent{}

class fetchAllFeedEvent extends FeedEvent{
  String? url;
  List<FeedEntity> existingFeed = [];
  bool showLoading = true;

  fetchAllFeedEvent({this.url, this.existingFeed = const [], this.showLoading = true});
}

class fetchFilteredFeedEvent extends FeedEvent{
}