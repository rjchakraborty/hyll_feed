
import 'package:hyll/data/models/feed_entity.dart';

abstract class FeedState {}

class FeedInitialState extends FeedState {}
class FeedLoadingState extends FeedState {}
class FeedSuccessState extends FeedState {
  final List<FeedEntity> feedList;
  String nextLink = '';
  String prevLink = '';
  int count = 0;

  FeedSuccessState({required this.feedList, this.nextLink = '', this.prevLink = '', this.count = 0});
}
class FeedErrorState extends FeedState {
  final String errorMessage;
  FeedErrorState({required this.errorMessage});
}