
import 'package:flutter/material.dart';
import 'package:shuaiclock/routes/home_route.dart';
import 'package:shuaiclock/routes/theme_route.dart';

class Routes{

  static const String HOME_ROUTE  = "/";
  static const String THEME_ROUTE  = "/theme";


  static Map<String , WidgetBuilder> getRoutesMap(BuildContext context){
    return {
      HOME_ROUTE : (context) => HomeRoute(),
      THEME_ROUTE : (context) => ThemeRoute(),
    
    };
  }

}