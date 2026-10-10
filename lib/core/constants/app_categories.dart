import 'package:evently/core/app_images.dart';
import 'package:flutter/material.dart';

class AppCategories {
  final String id;
  final String name;
  final String image;
  final IconData icon;

  AppCategories({
    required this.id,
    required this.name,
    required this.image,
    required this.icon,
  });

  static List<AppCategories> categories = [
    AppCategories(
      id: 'sport',
      name: 'Sport',
      image: AppImages.sport,
      icon: Icons.pedal_bike,
    ),
    AppCategories(
      id: 'birthday',
      name: 'Birthday',
      image: AppImages.birthday,
      icon: Icons.baby_changing_station,
    ),
    AppCategories(
      id: 'bookClub',
      name: 'BookClub',
      image: AppImages.bookClub,
      icon: Icons.book,
    ),
    AppCategories(
      id: 'exhibition',
      name: 'Exhibition',
      image: AppImages.exhibition,
      icon: Icons.sunny,
    ),
    AppCategories(
      id: 'meeting',
      name: 'Meeting',
      image: AppImages.meeting,
      icon: Icons.camera_indoor_rounded,
    ),
  ];
}
