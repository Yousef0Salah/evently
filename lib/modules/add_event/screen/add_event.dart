import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/core/constants/app_categories.dart';
import 'package:evently/modules/layout/widgets/tap_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});
  static const String id = 'addEvent';

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text('Add event', style: theme.textTheme.titleLarge),
        centerTitle: true,
        leading: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            alignment: provider.appLocale == Locale('ar')
                ? .centerLeft
                : .centerRight,
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: .circular(8),
              border: Border.all(color: theme.dividerColor),
            ),
            child: Icon(
              Icons.arrow_back_ios,
              color: theme.colorScheme.onSurface,
              size: 24,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              ClipRRect(
                borderRadius: .circular(16),
                child: Image.asset(
                  AppCategories.categories[currentIndex].image,
                ),
              ),
              DefaultTabController(
                length: AppCategories.categories.length,
                child: TabBar(
                  onTap: (value) {
                    currentIndex = value;
                    setState(() {});
                  },
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  tabAlignment: .start,
                  padding: .all(0),
                  labelPadding: .all(8),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    ...AppCategories.categories.map((e) {
                      return TapWidget(
                        categories: e,
                        isSelected:
                            currentIndex == AppCategories.categories.indexOf(e),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text('Title', style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(hint: Text('Event Title')),
              ),
              const SizedBox(height: 8),
              Text('Description', style: theme.textTheme.titleLarge),
              const SizedBox(height: 8),
              SizedBox(
                height: 170,
                child: TextFormField(
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hint: Text('Event Description...'),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Icon(Icons.date_range_outlined, color: theme.primaryColor),
                  const SizedBox(width: 8),
                  Text('Event Date', style: theme.textTheme.titleLarge),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      );
                    },
                    child: Text(
                      'Choose date',
                      style: theme.textTheme.titleMedium!.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              Row(
                children: [
                  Icon(Icons.access_time, color: theme.primaryColor),
                  const SizedBox(width: 8),
                  Text('Event Time', style: theme.textTheme.titleLarge),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                    },
                    child: Text(
                      'Choose time',
                      style: theme.textTheme.titleMedium!.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: .circular(16)),
                  padding: .all(12),
                ),
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Add event',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: .w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
