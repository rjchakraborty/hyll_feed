// Copyright © 2020 Birju Vachhani. All rights reserved.
// Use of this source code is governed by an Apache license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hyll/utils/HexColor.dart';
import 'package:hyll/utils/app_constants.dart';

import '../theme_data.dart';
import 'adaptive_theme_manager.dart';
import 'adaptive_theme_mode.dart';
import 'adaptive_theme_preferences.dart';

/// Builder function to build themed widgets
typedef AdaptiveThemeBuilder = Widget Function(ThemeData light, ThemeData dark);

/// Widget that allows to switch themes dynamically. This is intended to be
/// used above [MaterialApp].
/// Example:
///
/// AdaptiveTheme(
///   light: lightTheme,
///   dark: darkTheme,
///   initial: AdaptiveThemeMode.light,
///   builder: (theme, darkTheme) => MaterialApp(
///     theme: theme,
///     darkTheme: darkTheme,
///     home: MyHomePage(),
///   ),
/// );
class AdaptiveTheme extends StatefulWidget {
  /// Represents the light theme for the app.
  final ThemeData light;

  /// Represents the dark theme for the app.
  final ThemeData dark;

  /// Indicates which [AdaptiveThemeMode] to use initially.
  final AdaptiveThemeMode initial;

  /// Provides a builder with access of light and dark theme. Intended to
  /// be used to return [MaterialApp].
  final AdaptiveThemeBuilder builder;

  /// Key used to store theme information into shared-preferences. If you want
  /// to persist theme mode changes even after shared-preferences
  /// is cleared (e.g. after log out), do not remove this [prefKey] key from
  /// shared-preferences.
  static const String prefKey = 'adaptive_theme_preferences';

  /// Primary constructor which allows to configure themes initially.
  const AdaptiveTheme({
    super.key,
    required this.light,
    ThemeData? dark,
    required this.initial,
    required this.builder,
  }) : dark = dark ?? light;

  @override
  State<AdaptiveTheme> createState() => _AdaptiveThemeState();

  /// Returns reference of the [AdaptiveThemeManager] which allows access of
  /// the state object of [AdaptiveTheme] in a restrictive way.
  static AdaptiveThemeManager<ThemeData> of(BuildContext context) =>
      context.findAncestorStateOfType<State<AdaptiveTheme>>()! as AdaptiveThemeManager<ThemeData>;

  /// Returns reference of the [AdaptiveThemeManager] which allows access of
  /// the state object of [AdaptiveTheme] in a restrictive way.
  /// This returns null if the state instance of [AdaptiveTheme] is not found.
  static AdaptiveThemeManager<ThemeData>? maybeOf(BuildContext context) {
    final state = context.findAncestorStateOfType<State<AdaptiveTheme>>();
    if (state == null) return null;
    return state as AdaptiveThemeManager<ThemeData>;
  }

  /// returns most recent theme mode. This can be used to eagerly get previous
  /// theme mode inside main method before calling [runApp].
  static AdaptiveThemeMode getThemeMode() {
    return ThemePreferences.fromPrefs().mode;
  }

  static ThemeData getCurrentTheme() {
    if (ThemePreferences.fromPrefs().mode == AdaptiveThemeMode.system) {
      if (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) {
        return kDarkTheme;
      } else {
        return kLightTheme;
      }
    } else if (ThemePreferences.fromPrefs().mode == AdaptiveThemeMode.dark) {
      return kDarkTheme;
    } else {
      return kLightTheme;
    }
  }

  static Color getCurrentInvertColor() {
    if (ThemePreferences.fromPrefs().mode == AdaptiveThemeMode.system) {
      if (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) {
        return Colors.white;
      } else {
        return HexColor.getColor(PRIMARY_COLOR_HEX);
      }
    } else if (ThemePreferences.fromPrefs().mode == AdaptiveThemeMode.dark) {
      return Colors.white;
    } else {
      return HexColor.getColor(PRIMARY_COLOR_HEX);
    }
  }

  static Color getCurrentMainColor() {
    if (ThemePreferences.fromPrefs().mode == AdaptiveThemeMode.system) {
      if (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) {
        return HexColor.getColor(PRIMARY_COLOR_HEX);
      } else {
        return Colors.white;
      }
    } else if (ThemePreferences.fromPrefs().mode == AdaptiveThemeMode.dark) {
      return HexColor.getColor(PRIMARY_COLOR_HEX);
    } else {
      return Colors.white;
    }
  }

  static Color getCurrentSTDColor() {
    if (ThemePreferences.fromPrefs().mode == AdaptiveThemeMode.system) {
      if (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) {
        return Colors.black;
      } else {
        return Colors.white;
      }
    } else if (ThemePreferences.fromPrefs().mode == AdaptiveThemeMode.dark) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }


  static Brightness getCurrentBrightness() {
    if (ThemePreferences.fromPrefs().mode == AdaptiveThemeMode.system) {
      return SchedulerBinding.instance.window.platformBrightness;
    } else if (ThemePreferences.fromPrefs().mode == AdaptiveThemeMode.dark) {
      return Brightness.dark;
    } else {
      return Brightness.light;
    }
  }

  static Brightness getAlterBrightness() {
    if (ThemePreferences.fromPrefs().mode == AdaptiveThemeMode.system) {
      if (SchedulerBinding.instance.window.platformBrightness == Brightness.dark) {
        return Brightness.light;
      } else {
        return Brightness.dark;
      }
    } else if (ThemePreferences.fromPrefs().mode == AdaptiveThemeMode.dark) {
      return Brightness.light;
    } else {
      return Brightness.dark;
    }
  }
}

class _AdaptiveThemeState extends State<AdaptiveTheme> with WidgetsBindingObserver, AdaptiveThemeManager<ThemeData> {

  setStatusBarColor(){
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  void initState() {
    super.initState();
    initialize(
      light: widget.light,
      dark: widget.dark,
      initial: widget.initial,
    );
    WidgetsBinding.instance.addObserver(this);
    setStatusBarColor();
  }

  // When device theme mode is changed, Flutter does not rebuild
  /// [CupertinoApp] and Because of that, if theme is set to
  /// [AdaptiveThemeMode.system]. it doesn't take effect. This check mitigates
  /// that and refreshes the UI to use new theme if needed.
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    if (mode.isSystem && mounted) {
      setStatusBarColor();
      setState(() {});
      Get.appUpdate();
    }
  }

  @override
  bool get isDefault => lightTheme == widget.light && darkTheme == widget.dark && mode == defaultMode;

  @override
  Brightness get brightness => theme.brightness;

  @override
  Future<bool> reset() async {
    setTheme(
      light: widget.light,
      dark: widget.dark,
      notify: false,
    );
    return super.reset();
  }

  @override
  Widget build(BuildContext context) => widget.builder(theme, mode.isLight ? theme : darkTheme);

  @override
  void updateState() {
    if (mounted) {
      setStatusBarColor();
      setState(() {});
      Get.appUpdate();
    }
  }

  @override
  void dispose() {
    modeChangeNotifier.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
