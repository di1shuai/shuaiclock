import 'package:flutter/material.dart';
import 'package:shuaiclock/common/clock_theme.dart';
import 'package:shuaiclock/models/profile.dart';

import 'global.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}

class ThemeProvider extends ProfileChangeNotifier {
  ClockTheme get clockTheme => Global.clockThemes[_profile.clockThemeIndex];
  
  Color get theme => Global.themes[_profile.themeIndex];
  
  int get themeIndex => _profile.themeIndex;

  set themeIndex(int themeIndex) {
    Global.profile.themeIndex = themeIndex;
    notifyListeners();
  }

  int get clockThemeIndex => _profile.clockThemeIndex;

  set clockThemeIndex(int clockThemeIndex) {
    Global.profile.clockThemeIndex = clockThemeIndex;
    notifyListeners();
  }

}
