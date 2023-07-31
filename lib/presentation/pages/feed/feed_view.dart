import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hyll/blocs/carousel/carousel_event.dart';
import 'package:hyll/blocs/feed/feed_bloc.dart';
import 'package:hyll/blocs/feed/feed_event.dart';
import 'package:hyll/blocs/feed/feed_state.dart';
import 'package:hyll/controller/general_controller.dart';
import 'package:hyll/blocs/carousel/carousel_bloc.dart';
import 'package:hyll/data/models/feed_entity.dart';
import 'package:hyll/presentation/widgets/featured_item.dart';
import 'package:hyll/presentation/widgets/no_content_widget.dart';
import 'package:hyll/presentation/widgets/page_builder_widget.dart';
import 'package:hyll/presentation/widgets/skeleton/shimmer_view.dart';
import 'package:hyll/theme_manager/adaptive_theme/adaptive_theme.dart';
import 'package:hyll/utils/HexColor.dart';
import 'package:hyll/utils/app_constants.dart';
import 'package:hyll/presentation/widgets/error_widget.dart' as _ew;
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hyll/theme_manager/theme_fonts.dart';
import 'package:hyll/utils/common_utils.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';

/// A [StatelessWidget] that:
/// * demonstrates how to consume and interact with a [FeedBloc].
/// {@endtemplate}
class FeedView extends StatelessWidget {
  /// {@macro feed_view}
  FeedView({super.key});

  callHomeAPI(BuildContext context) async {
    context.read<FeedBloc>().add(fetchAllFeedEvent());
  }

  @override
  Widget build(BuildContext context) {
    context.read<FeedBloc>().add(fetchAllFeedEvent());
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: AdaptiveTheme.getCurrentMainColor(),
        child: BlocBuilder<FeedBloc, FeedState>(
          builder: (context, state) {
            if (state is FeedInitialState || state is FeedLoadingState) {
              return ShimmerView();
            } else if (state is FeedSuccessState) {
              if (state.feedList.isNotEmpty) {
                return PageBuilderWidget(feedList: state.feedList, nextUrl: state.nextLink);
              } else {
                return NoContentWidget();
              }
            } else {
              return NoContentWidget();
            }
          },
        ),
      ),
    );
  }
}
