import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'task_states.dart';

class TaskCubit extends Cubit<TaskStates> {
  TaskCubit() : super(InitialState());

  static TaskCubit get(context) => BlocProvider.of(context);

  DateRangePickerController dateController = DateRangePickerController();
  TextEditingController taskNameController= TextEditingController();
  TextEditingController taskDescriptionController= TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  TimeOfDay firstTime = TimeOfDay.fromDateTime(DateTime.now());
  TimeOfDay endTime = TimeOfDay.fromDateTime(DateTime.now());

  String selectedDate = DateTime.now().toString();
  String dateCount = '';
  String range = '';
  String rangeCount = '';



  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
      // ignore: lineslonger_than_80_chars
          ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
    } else if (args.value is DateTime) {
      selectedDate = args.value.toString();
    } else if (args.value is List<DateTime>) {
      dateCount = args.value.length.toString();
    } else {
      rangeCount = args.value.length.toString();
    }
    emit(GetDate());
  }

  void selectFirstTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: firstTime,
    );
    if (newTime != null) {

      firstTime = newTime;
        emit(GetStartTime());

    }
  }
  void selectEndTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: endTime,
    );
    if (newTime != null) {

      endTime = newTime;
        emit(GetEndTime());

    }
  }

  List<Map<String,dynamic>> categoryName = [
    {
      "name":"Development",
      "isSelected":true
    },
    {
      "name":"Research",
      "isSelected":false
    },
    {
      "name":"Design",
      "isSelected":false
    },
    {
      "name":"Backend",
      "isSelected":false
    }

  ];

    bool isCategorySelected(int index) {
    return categoryName[index]['isSelected'] == true;

  }
}
