import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List dayListText = [];
  List dayListNum = [];
  DateTime dateTime = DateTime.now();
  ScrollController scrollController = ScrollController();
  int tabIndex = DateTime.now().day - 1;

  // this function to get how many days in a month
  int getDaysInMonth() {
    if (dateTime.month == DateTime.february) {
      final bool isLeapYear =
          (dateTime.year % 4 == 0) && (dateTime.year % 100 != 0) ||
              (dateTime.year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[
      31,
      -1,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    return daysInMonth[dateTime.month - 1];
  }

  // this function to get day with its number
  void getWeekDays() {
    for (int i = 1; i <= getDaysInMonth(); i++) {
      dayListText.add(DateFormat.E()
          .format(DateTime.utc(dateTime.year, dateTime.month, i))
          .toString());
      dayListNum.add(DateFormat.d()
          .format(DateTime.utc(dateTime.year, dateTime.month, i))
          .toString());
    }
    emit(GetDayNumAndText());
  }

// those two functions to check the day when i click on Tab to change tab and text color color
  bool checkDay(int index) {
    return index == tabIndex;
  }

  onTap(int index) {
    tabIndex = index;
    emit(CheckDay());
  }

  List<String> taskIconName = ['meeting', 'phone', 'mail'];
  List<String> taskName = ['Team Meeting', 'Call the stylist', 'Check mail'];
  List<String> taskDescription = [
    'Discuss all questions about new project',
    'Agree on an evening look',
    'Write to The Manager'
  ];
}
