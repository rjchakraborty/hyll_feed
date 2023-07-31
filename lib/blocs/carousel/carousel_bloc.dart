import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyll/blocs/carousel/carousel_event.dart';


class CarouselBloc extends Bloc<CarouselEvent, int> {
  CarouselBloc() : super(0) {
    on<ChangeIndicatorEvent>((event, emit) => emit(event.index));
  }
}