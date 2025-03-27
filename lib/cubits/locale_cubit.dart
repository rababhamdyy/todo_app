import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class LocaleCubit extends Cubit<Locale> {
  final Box<String> _settingsBox;

  LocaleCubit(this._settingsBox) : super(_getSavedLocale(_settingsBox));

  static Locale _getSavedLocale(Box<String> box) {
    final savedLocale = box.get('locale', defaultValue: 'en');
    return Locale(savedLocale!);
  }

  void changeLocale(String languageCode) {
    emit(Locale(languageCode));
    _settingsBox.put('locale', languageCode);
  }
}
