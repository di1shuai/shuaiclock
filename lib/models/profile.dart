import 'dart:convert';

class Profile {
  int themeIndex;
  Profile({
    this.themeIndex,
  });

  Profile copyWith({
    int themeIndex,
  }) {
    return Profile(
      themeIndex: themeIndex ?? this.themeIndex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'themeIndex': themeIndex,
    };
  }

  static Profile fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Profile(
      themeIndex: map['themeIndex'],
    );
  }

  String toJson() => json.encode(toMap());

  static Profile fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Profile(themeIndex: $themeIndex)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Profile &&
      o.themeIndex == themeIndex;
  }

  @override
  int get hashCode => themeIndex.hashCode;
}
