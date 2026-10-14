import 'package:evently/core/app_images.dart';
import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/core/constants/app_categories.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/db_service.dart';
import 'package:evently/modules/add_event/manager/event_provider.dart';
import 'package:evently/modules/edit_event/screens/edit_event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key, required this.event});
  static const String id = 'eventDetails';
  final EventModel event;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppProvider>(context);
    AppCategories categories = AppCategories.categories.firstWhere(
      (element) => element.id == event.categoryId,
    );
    
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          title: Text('Event details', style: theme.textTheme.titleLarge),
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

          actions: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => EditEvent(event: event)),
                );
              },
              child: Container(
                padding: .all(8),
                decoration: BoxDecoration(
                  borderRadius: .circular(8),
                  color: theme.colorScheme.surface,
                ),
                child: Image.asset(
                  AppImages.edit,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () {
                DbService.deleteEvent(event.id);
                Navigator.pop(context);
              },
              child: Container(
                padding: .all(8),
                decoration: BoxDecoration(
                  borderRadius: .circular(8),
                  color: theme.colorScheme.surface,
                ),

                child: Image.asset(
                  AppImages.delete,
                  color: theme.colorScheme.error,
                ),
              ),
            ),
            const SizedBox(width: 4),
          ],
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
                    child: Image.asset(categories.image),
                  ),

                  const SizedBox(height: 8),
                  Text(event.title, style: theme.textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Container(
                    padding: .all(16),
                    decoration: BoxDecoration(
                      borderRadius: .circular(16),
                      color: theme.colorScheme.surface,
                    ),
                    child: Row(
                      children: [
                        Container(
                          alignment: .center,
                          padding: .all(12),
                          decoration: BoxDecoration(
                            borderRadius: .circular(12),
                            color: theme.scaffoldBackgroundColor,
                          ),
                          child: Icon(
                            Icons.date_range_rounded,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat.MMMMd('en_GB').format(
                                DateTime.tryParse(event.date.toString()) ??
                                    DateTime.now(),
                              ),
                              style: theme.textTheme.titleLarge!.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(event.time, style: theme.textTheme.bodyMedium),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Description', style: theme.textTheme.titleLarge),

                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 200,
                    padding: .all(16),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: .circular(16),
                    ),
                    child: Text(
                      event.desc,
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                        fontWeight: .w400,
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
