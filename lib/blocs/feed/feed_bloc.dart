import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyll/api_manager/common_http_client.dart';
import 'package:hyll/blocs/feed/feed_event.dart';
import 'package:hyll/blocs/feed/feed_state.dart';
import 'package:hyll/controller/general_controller.dart';
import 'package:hyll/data/models/feed_entity.dart';
import 'package:hyll/enums/method_type.dart';
import 'package:hyll/utils/app_constants.dart';
import 'package:hyll/utils/common_utils.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedInitialState()) {
    on<FeedEvent>((event, emit) async {
      if (event is fetchAllFeedEvent) {
        if(event.showLoading) {
          emit(FeedLoadingState()); //Loading Takes Place
        }
        String feedUrl = adventures_login_api;
        List<FeedEntity> existingFeed = event.existingFeed;
        if (CommonUtils.checkIfNotNull(event.url)) {
          feedUrl = event.url!;
        }
        GeneralController.loadedUrls.add(feedUrl);
        final response = await CommonHttpClient(feedUrl, body: <String, String>{}, method: MethodType.GET).getDigestAuthResponse();

        if (response != null) {
          if (CommonUtils.checkIfNotNull(response.body)) {
            Map<String, dynamic>? resMap = jsonDecode(response.body);
            if (resMap != null) {
              int count = (resMap['count'] as int?) ?? 0;
              String nextLink = (resMap['next'] as String?) ?? '';
              String prevLink = (resMap['previous'] as String?) ?? '';
              if (resMap['data'] != null) {
                var list = resMap['data'] as List?;
                if (list != null && list.isNotEmpty) {
                  try {
                    List<FeedEntity> fList = [];
                    if(existingFeed.isNotEmpty) {
                      fList.addAll(existingFeed);
                    }
                    fList.addAll(await list.map((i) => FeedEntity.fromJson(i)).toList());

                    emit(FeedSuccessState(feedList: fList, nextLink: nextLink, prevLink: prevLink, count: count));
                  } catch (e) {
                    emit(FeedErrorState(errorMessage: e.toString()));
                  }
                }
              }
            }
          }
        }
      }

      if (event is fetchFilteredFeedEvent) {
        //todo add functionalities
      }
    });
  }
}
