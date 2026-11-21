import 'package:evently/core/app_images.dart';
import 'package:flutter/material.dart';

class AppCategories {
  final String id;
  final String name;
  final String image;
  final String darkImage;
  final IconData icon;

  AppCategories({
    required this.id,
    required this.name,
    required this.image,
    required this.icon, required this.darkImage,
  });

  static List<AppCategories> categories = [
    AppCategories(
      id: 'sport',
      name: 'Sport',
      image: AppImages.sport,
      darkImage: AppImages.darkSport,
      icon: Icons.pedal_bike,
    ),
    AppCategories(
      id: 'birthday',
      name: 'Birthday',
      image: AppImages.birthday,
      darkImage: AppImages.darkBirthday,
      icon: Icons.baby_changing_station,
    ),
    AppCategories(
      id: 'bookClub',
      name: 'BookClub',
      image: AppImages.bookClub,
      darkImage: AppImages.darkBookClub,
      icon: Icons.book,
    ),
    AppCategories(
      id: 'exhibition',
      name: 'Exhibition',
      image: AppImages.exhibition,
      darkImage: AppImages.darkExhibition,
      icon: Icons.sunny,
    ),
    AppCategories(
      id: 'meeting',
      name: 'Meeting',
      image: AppImages.meeting,
      darkImage: AppImages.darkMeeting,
      icon: Icons.camera_indoor_rounded,
    ),
  ];
}
