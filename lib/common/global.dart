import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shuaiclock/common/clock_theme.dart';
import 'package:shuaiclock/models/profile.dart';
import 'package:wakelock/wakelock.dart';

const _themes = <ClockTheme>[ClockTheme.DIGITAL, ClockTheme.ANALOG];

class Global {
  static SharedPreferences _prefs;
  static Profile profile = Profile(themeIndex: 0,clockThemeIndex: 0);
  // 可选的主题列表
  static List<ClockTheme> get themes => _themes;

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    print("===== init start ======");
    if (Platform.isAndroid || Platform.isIOS) {
      Wakelock.enable();
    }

    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(_profile);
        print("profile -> $profile");
      } catch (e) {
        print(e);
      }
    }

    print("===== init end ======");
  }

  // 持久化Profile信息
  static saveProfile() => _prefs.setString("profile", profile.toJson());
}
