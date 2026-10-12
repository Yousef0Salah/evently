import 'package:evently/core/app_images.dart';
import 'package:evently/core/constants/app_categories.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key, required this.event, this.onTapFav});
  final EventModel event;
  final Function()? onTapFav;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    var category = AppCategories.categories.firstWhere((element) {
      return element.id == event.categoryId;
    });
    return Container(
      width: double.infinity,
      height: 200,

      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        image: DecorationImage(
          image: AssetImage(category.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: .start,
          mainAxisAlignment: .spaceBetween,
          children: [
            Container(
              padding: .all(8),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: .circular(8),
                border: Border.all(color: theme.dividerColor),
              ),
              child: Text(
                event.date.substring(0, 10),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: .w600,
                  color: colorScheme.primary,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: .circular(8),
                border: Border.all(color: theme.dividerColor),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(fontSize: 14, fontWeight: .w500),
                  ),
                  InkWell(
                    onTap: () {
                      onTapFav!();
                    },
                    child:
                        event.usersFav.contains(
                          FirebaseAuth.instance.currentUser!.uid,
                        )
                        ? Image.asset(
                            AppImages.selectedHeart,
                            color: colorScheme.primary,
                          )
                        : Image.asset(
                            AppImages.heart,
                            color: colorScheme.primary,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
