abstract class ButtonState {}

class ButtonIntialState extends ButtonState {}

class ButtonLoadingState extends ButtonState {}

class ButtonSuccessState extends ButtonState {}

class ButtonFailureState extends ButtonState {
  ButtonFailureState({required this.errorMessage});
  final String errorMessage;
}
