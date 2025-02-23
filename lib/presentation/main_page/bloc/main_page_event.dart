part of 'main_page_bloc.dart';

@immutable
abstract class MainPageEvent extends Equatable {}

class MainPageEventOnIncreaseCounter extends MainPageEvent {
  @override
  List<Object?> get props => [];
}

class MainPageEventOnIncreaseSecondCounter extends MainPageEvent {
  @override
  List<Object?> get props => [];
}

class MainPageEventOnText extends MainPageEvent {
  MainPageEventOnText({
    required this.text
  });
  final String text;

  @override
  List<Object?> get props => [text];
}
