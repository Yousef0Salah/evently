import 'package:evently/core/constants/app_categories.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/db_service.dart';
import 'package:evently/modules/layout/screens/layout_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventProvider extends ChangeNotifier {
  EventProvider({EventModel? event}) {
    if (event != null) {
      initializeForEdit(event);
    }
  }

  int currentIndex = 0;
  AppCategories selectedCategory = AppCategories.categories.first;
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descEditingController = TextEditingController();
  DateTime? selecteddate;
  TimeOfDay? selectedtime;
  List<EventModel> events = [];
  String id = '';

  void initializeForEdit(EventModel event) {
    titleEditingController.text = event.title;
    descEditingController.text = event.desc;
    id = event.id;
    selecteddate = DateTime.parse(event.date);
    selectedtime = parseTime(event.time);

    currentIndex = AppCategories.categories.indexWhere(
      (category) => category.id == event.categoryId,
    );

    if (currentIndex != -1) {
      selectedCategory = AppCategories.categories[currentIndex];
    } else {
      currentIndex = 0;
      selectedCategory = AppCategories.categories.first;
    }
  }

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

  void updateEvent(BuildContext context) {
    isLoading = true;
    notifyListeners();
    DbService.updateEvent(
      EventModel(
        id: id,

        categoryId: selectedCategory.id,
        title: titleEditingController.text,
        desc: descEditingController.text,
        date: selecteddate.toString(),
        time: selectedtime!.format(context),
      ),
    );
    isLoading = false;
    notifyListeners();
    Navigator.pushNamedAndRemoveUntil(
      context,
      LayoutScreen.id,
      (route) => false,
    );
  }

  void getEvent() async {
    events = await DbService.getEvent();
    notifyListeners();
  }

  void deleteEvent(String id, BuildContext context) async {
    await DbService.deleteEvent(id);
    Navigator.pop(context);
  }
}

TimeOfDay parseTime(String time) {
  final parsedTime = DateFormat('h:mm a', 'en_US').parse(time);

  return TimeOfDay(hour: parsedTime.hour, minute: parsedTime.minute);
}
