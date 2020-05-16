import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuaiclock/common/providers.dart';

import 'common/global.dart';
import 'common/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(ShuaiClock()));
}

class ShuaiClock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
            create: (_) => ThemeProvider(),
          ),
        ],
        child: MaterialApp(
            title: 'Shuai Clock',
            theme: ThemeData.dark(),
            routes: Routes.getRoutesMap(context)));
  }
}
