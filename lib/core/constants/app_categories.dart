import 'package:evently/core/app_images.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AppCategories {
  final String id;
  final String nameKey;
  final String image;
  final String darkImage;
  final IconData icon;

  AppCategories({
    required this.id,
    required this.nameKey,
    required this.image,
    required this.darkImage,
    required this.icon,
  });

  String localizedName(AppLocalizations l10n) {
    switch (nameKey) {
      case 'all':
        return l10n.all;
      case 'categorySport':
        return l10n.categorySport;
      case 'categoryBirthday':
        return l10n.categoryBirthday;
      case 'categoryBookClub':
        return l10n.categoryBookClub;
      case 'categoryExhibition':
        return l10n.categoryExhibition;
      case 'categoryMeeting':
        return l10n.categoryMeeting;
      default:
        return id;
    }
  }

  static List<AppCategories> categories = [
    AppCategories(
      id: 'sport',
      nameKey: 'categorySport',
      image: AppImages.sport,
      darkImage: AppImages.darkSport,
      icon: Icons.pedal_bike,
    ),
    AppCategories(
      id: 'birthday',
      nameKey: 'categoryBirthday',
      image: AppImages.birthday,
      darkImage: AppImages.darkBirthday,
      icon: Icons.baby_changing_station,
    ),
    AppCategories(
      id: 'bookClub',
      nameKey: 'categoryBookClub',
      image: AppImages.bookClub,
      darkImage: AppImages.darkBookClub,
      icon: Icons.book,
    ),
    AppCategories(
      id: 'exhibition',
      nameKey: 'categoryExhibition',
      image: AppImages.exhibition,
      darkImage: AppImages.darkExhibition,
      icon: Icons.sunny,
    ),
    AppCategories(
      id: 'meeting',
      nameKey: 'categoryMeeting',
      image: AppImages.meeting,
      darkImage: AppImages.darkMeeting,
      icon: Icons.camera_indoor_rounded,
    ),
  ];
}