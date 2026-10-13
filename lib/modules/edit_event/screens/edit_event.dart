import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/core/constants/app_categories.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/modules/add_event/manager/event_provider.dart';
import 'package:evently/modules/layout/widgets/tap_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditEvent extends StatelessWidget {
  const EditEvent({super.key, required this.event});
  static const String id = 'editEvent';
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          title: Text('Edit event', style: theme.textTheme.titleLarge),
          centerTitle: true,
          leading: FittedBox(
            fit: BoxFit.scaleDown,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<EventProvider>(
              builder: (context, provider, child) => Column(
                crossAxisAlignment: .start,
                children: [
                  ClipRRect(
                    borderRadius: .circular(16),
                    child: Image.asset(provider.selectedCategory.image),
                  ),
                  DefaultTabController(
                    length: AppCategories.categories.length,
                    child: TabBar(
                      onTap: provider.indexChange,
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
                                provider.currentIndex ==
                                AppCategories.categories.indexOf(e),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Title', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: provider.titleEditingController,
                    decoration: InputDecoration(hint: Text('Event Title')),
                  ),
                  const SizedBox(height: 8),
                  Text('Description', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 170,
                    child: TextFormField(
                      controller: provider.descEditingController,
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
                      Icon(
                        Icons.date_range_outlined,
                        color: theme.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text('Event Date', style: theme.textTheme.titleLarge),
                      Spacer(),
                      GestureDetector(
                        onTap: () async {
                          showDatePicker(
                            context: context,
                            initialDate: provider.selecteddate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(Duration(days: 365)),
                          ).then((value) {
                            if (value != null) {
                              provider.dateChange(value);
                            }
                          });
                        },
                        child: Text(
                          provider.selecteddate == null
                              ? 'Choose date'
                              : DateFormat.yMd().format(provider.selecteddate!),
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
                          ).then((value) {
                            if (value != null) {
                              provider.timeChange(value);
                            }
                          });
                        },
                        child: Text(
                          provider.selectedtime == null
                              ? 'Choose time'
                              : provider.selectedtime!.format(context),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: .circular(16),
                      ),
                      padding: .all(12),
                    ),
                    onPressed: () {
                      provider.addEvent(context);
                    },
                    child: Center(
                      child: provider.isLoading
                          ? CircularProgressIndicator()
                          : Text(
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
        ),
      ),
    );
  }
}
