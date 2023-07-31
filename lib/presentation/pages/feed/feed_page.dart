import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyll/blocs/carousel/carousel_bloc.dart';
import 'package:hyll/blocs/feed/feed_bloc.dart';
import 'package:hyll/presentation/pages/feed/feed_view.dart';

/// A [StatelessWidget] that:
/// * provides a [FeedBloc] to the [FeedView].
/// {@endtemplate}
class FeedPage extends StatelessWidget {
  /// {@macro feed_page}
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => FeedBloc()),
      BlocProvider(create: (_) => CarouselBloc())
    ], child: FeedView());
  }
}
