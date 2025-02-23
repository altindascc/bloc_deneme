part of 'main_page_bloc.dart';

@immutable
class MainPageState extends Equatable {
  final int counter;
  final String text;
  final int secondCounter;

  MainPageState(
      {required this.counter, required this.text, required this.secondCounter});

  factory MainPageState.initial() =>
      MainPageState(counter: 0, secondCounter: 0, text: '');

  @override
  List<Object?> get props => [counter, secondCounter, text];

  MainPageState copyWith({int? counter, String? text, int? secondCounter}) {
    return MainPageState(
        counter: counter ?? this.counter,
        text: text ?? this.text,
        secondCounter: secondCounter ?? this.secondCounter);
  }
}
