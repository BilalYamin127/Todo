// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModeChangeState {
  bool? isDarkMode;
  ThemeMode? thememode;
  ModeChangeState({
    this.isDarkMode,
    this.thememode,
  });

  ModeChangeState copyWith({
    bool? isDarkMode,
    ThemeMode? thememode,
  }) {
    return ModeChangeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      thememode: thememode ?? this.thememode,
    );
  }

  @override
  String toString() =>
      'ModeChangeState(isDarkMode: $isDarkMode, thememode: $thememode)';
}

class ModeChangeNotifier extends Notifier<ModeChangeState> {
  @override
  build() {
    return ModeChangeState(isDarkMode: false, thememode: ThemeMode.light);
  }

  void setDarkMode() {
    state = ModeChangeState(thememode: ThemeMode.dark, isDarkMode: true);
  }

  void setLightMode() {
    state = ModeChangeState(thememode: ThemeMode.light, isDarkMode: false);
  }
}

final modeChangeProvider =
    NotifierProvider<ModeChangeNotifier, ModeChangeState>(
        ModeChangeNotifier.new);
