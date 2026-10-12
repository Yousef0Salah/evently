import 'package:evently/core/constants/app_categories.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/db_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EventProvider extends ChangeNotifier {
  int currentIndex = 0;
  AppCategories selectedCategory = AppCategories.categories.first;
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descEditingController = TextEditingController();
  DateTime? selecteddate;
  TimeOfDay? selectedtime;
  List<EventModel> events = [];

  void indexChange(int index) {
    currentIndex = index;
    selectedCategory = AppCategories.categories[index];
    notifyListeners();
  }

  void dateChange(DateTime date) {
    selecteddate = date;
    notifyListeners();
  }

  void timeChange(TimeOfDay time) {
    selectedtime = time;
    notifyListeners();
  }

  bool isLoading = false;
  void addEvent(BuildContext context) {
    isLoading = true;
    notifyListeners();
    DbService.addEvent(
      EventModel(
        id: '',
        categoryId: selectedCategory.id,
        title: titleEditingController.text,
        desc: descEditingController.text,
        date: selecteddate.toString(),
        time: selectedtime!.format(context),
      ),
    );
    isLoading = false;
    notifyListeners();
    Navigator.pop(context);
  }

  void getEvent() async {
    events = await DbService.getEvent();
    notifyListeners();
  }
}
