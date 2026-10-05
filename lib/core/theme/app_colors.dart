
import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._(); // منع إنشاء كائنات من هذا الكلاس


  static const Color lightMainColor = Color(0xFF0E3A99);      // أزرق داكن
  static const Color lightDisable = Color(0xFFB9B9B9);
  static const Color lightMainText = Color(0xFF1C1C1C);       // أسود
  static const Color lightSecText = Color(0xFF686868);        // رمادي داكن
  static const Color lightBackground = Color(0xFFF4F7FF);     // أبيض مائل للأزرق
  static const Color lightInputs = Color(0xFFFFFFFF);         // أبيض
  static const Color lightStroke = Color(0xFFF0F0F0);         // رمادي فاتح
  static const Color lightRed = Color(0xFFFF3232);

  static const Color darkMainColor = Color(0xFF457AED);       // أزرق فاتح
  static const Color darkDisable = Color(0xFFB9B9B9);
  static const Color darkMainText = Color(0xFFFFFFFF);        // أبيض
  static const Color darkSecText = Color(0xFFD6D6D6);         // رمادي فاتح
  static const Color darkBackground = Color(0xFF000F30);      // أزرق داكن جداً
  static const Color darkInputs = Color(0xFF001440);          // أزرق داكن
  static const Color darkStroke = Color(0xFF002D8F);          // أزرق متوسط
  static const Color darkRed = Color(0xFFFF3232);
}