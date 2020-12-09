import 'dart:convert';

class Profile {
  int themeIndex;
  int clockThemeIndex;
  Profile({
    this.themeIndex,
    this.clockThemeIndex,
  });

  Profile copyWith({
    int themeIndex,
    int clockThemeIndex,
  }) {
    return Profile(
      themeIndex: themeIndex ?? this.themeIndex,
      clockThemeIndex: clockThemeIndex ?? this.clockThemeIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'themeIndex': themeIndex,
      'clockThemeIndex': clockThemeIndex,
    };
  }

  static Profile fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Profile(
      themeIndex: map['themeIndex'],
      clockThemeIndex: map['clockThemeIndex'],
    );
  }

  String toJson() => json.encode(toMap());

  static Profile fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Profile(themeIndex: $themeIndex, clockThemeIndex: $clockThemeIndex)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Profile &&
      o.themeIndex == themeIndex &&
      o.clockThemeIndex == clockThemeIndex;
  }

  @override
  int get hashCode => themeIndex.hashCode ^ clockThemeIndex.hashCode;

}
