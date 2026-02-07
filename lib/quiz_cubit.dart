import 'package:flutter_bloc/flutter_bloc.dart';

class QuizCubit extends Cubit<bool> {
  QuizCubit() : super(false);
  void toggle() {
    emit(!state);
  }
}
