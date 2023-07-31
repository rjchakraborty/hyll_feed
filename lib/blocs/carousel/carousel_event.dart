abstract class CarouselEvent {}

class ChangeIndicatorEvent extends CarouselEvent{
  int index;

  ChangeIndicatorEvent({required this.index});
}