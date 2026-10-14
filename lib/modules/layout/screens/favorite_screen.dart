import 'package:evently/core/app_images.dart';
import 'package:evently/core/services/db_service.dart';
import 'package:evently/modules/auth/widgets/custom_text_form_field.dart';
import 'package:evently/modules/event_details/screens/event_details.dart';
import 'package:evently/modules/layout/widgets/event_widget.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});
  static const id = 'favorite';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextFormField(
                hint: 'Search for event',
                icon: AppImages.search,
              ),
              const SizedBox(height: 24),
              FutureBuilder(
                future: DbService.getEventFav(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    final events = snapshot.data ?? [];
                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    EventDetails(event: events[index]),
                              ),
                            );
                          },
                          child: EventWidget(
                            event: events[index],
                            onTapFav: () async {
                              await DbService.toggleFav(events[index]);
                              setState(() {});
                            },
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemCount: events.length,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
