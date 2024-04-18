import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedDateCubit extends Cubit<DateTime> {
  SelectedDateCubit(DateTime date) : super(date);

  setSelectedDate(DateTime date) {
    emit(date);
  }
}
